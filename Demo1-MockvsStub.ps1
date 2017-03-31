
function MockMe ($Path) {

    return (Get-ChildItem -Path $Path)
}

Describe 'Mock' { # Behavior Verification

    Mock Get-ChildItem -ParameterFilter {$Path -eq 'C:\foo'} -MockWith {$null}
    Mock Get-ChildItem -ParameterFilter {$Path -eq 'C:\bar'} -MockWith {$null}

    It 'Should call GCI Foo' {
        $output = MockMe 'C:\foo'
        Assert-MockCalled Get-ChildItem  -Times 1 -ParameterFilter {$Path -eq 'C:\foo'}
    }

    It 'Should call GCI Bar' {
        $output = MockMe 'C:\bar'
        Assert-MockCalled Get-ChildItem  -Times 1 -ParameterFilter {$Path -eq 'C:\bar'}
    }
}

function StubMe ($Path) {

    return (Get-ChildItem -Path $Path)
}

Describe 'Stub' { # State Verification

    Mock Get-ChildItem -MockWith {[PSCustomObject]@{Name="test.txt"
                                     "LastWriteTime"=(Get-Date "2000-01-01")}}

    It 'Should return test.txt' {
        $output = StubMe C:\Whatever
        $output.Name | Should Be 'test.txt'
    }
}

