#### Behavior Verification
Describe 'Mock' {

    Mock Get-ChildItem -ParameterFilter {$Recurse -eq $true} -MockWith {$null}
    Mock Get-ChildItem -ParameterFilter {$Recurse -eq $false} -MockWith {$null}


    It 'Should do a recursive GCI' {
        $output = Get-ChildItem -Recurse
        Assert-MockCalled Get-ChildItem  -Times 1 -ParameterFilter {$Recurse -eq $true}
    }
}

Describe 'Mock 2' {

    Mock Get-ChildItem -ParameterFilter {$Recurse -eq $false} -MockWith {$null}
    Mock Get-ChildItem -ParameterFilter {$Recurse -eq $false} -MockWith {$null}

    It 'Should do a recursive GCI' {
        $output = Get-ChildItem
        Assert-MockCalled Get-ChildItem  -Times 1 -ParameterFilter {$Recurse -eq $true}
    }

}

#### State Verification
Describe 'Stub' {

    Mock Get-ChildItem -MockWith {[PSCustomObject]@{Name="test.txt"; "LastWriteTime"=(Get-Date "2000-01-01")}}

    It 'Should return test.txt' {
        $output = Get-ChildItem C:\Whatever
        $output.Name | Should Be 'test.txt'
    }
}