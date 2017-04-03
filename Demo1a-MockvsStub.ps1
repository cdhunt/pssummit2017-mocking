function MockMe ($Path) {
    return (Get-ChildItem -Path $Path)
}

Describe 'Mock' { # Behavior Verification
    Mock Get-ChildItem -ParameterFilter {$Path -eq 'C:\foo'} -MockWith {$null}
    Mock Get-ChildItem -ParameterFilter {$Path -eq 'C:\bar'} -MockWith {$null}

    Context 'Foo' {
        It 'Should only call GCI Foo' {
            $output = MockMe 'C:\foo'
            Assert-MockCalled Get-ChildItem  -Times 1 -ParameterFilter {$Path -eq 'C:\foo'}
            Assert-MockCalled Get-ChildItem  -Times 0 -ParameterFilter {$Path -eq 'C:\bar'}
        }
    }

    Context 'Bar' {
        It 'Should only call GCI Bar' {
            $output = MockMe 'C:\bar'
            Assert-MockCalled Get-ChildItem  -Times 0 -ParameterFilter {$Path -eq 'C:\foo'}
            Assert-MockCalled Get-ChildItem  -Times 1 -ParameterFilter {$Path -eq 'C:\bar'}
        }
    }
}
