$scriptblock = [scriptblock]{
    Get-Process
}

Describe 'ScriptBlock' {

    Mock Get-Process {'Mocked PS'}

    It 'Should Mock Get-Process' {
        $results = $scriptblock.Invoke()
        Assert-MockCalled Get-Process -Times 1
    }
}