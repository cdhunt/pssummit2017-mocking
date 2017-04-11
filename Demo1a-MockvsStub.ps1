function MockMe ($Path) {
    return (Get-ChildItem -Path $Path -Filter "*.ps1")
}

Describe 'Mock' { # Behavior Verification
    Mock Get-ChildItem -ParameterFilter {$Path -eq 'C:\foo' -and $Filter -eq "*.ps1"} -MockWith {$null}

    Context 'Foo' {
        It 'Should only call GCI Foo' {
            $output = MockMe 'C:\foo'
            Assert-MockCalled Get-ChildItem  -Times 1 `
                -ParameterFilter {$Path -eq 'C:\foo' -and $Filter -eq "*.ps1"}
        }
    }
}
