function StubMe ($Path) {

    $files = Get-ChildItem -Path $Path
    return ($files | Select-Object -First 1 -ExpandProperty Name)
}

Describe 'Stub' { # State Verification

    Mock Get-ChildItem -MockWith {[PSCustomObject]@{Name="test.txt"
                                     "LastWriteTime"=(Get-Date "2000-01-01")}}

    It 'Should return test.txt' {
        $output = StubMe C:\Whatever
        $output | Should Be 'test.txt'
    }
}
