Describe 'Script File' {

    It 'Should call Demo2a-ScriptFiles.ps1' {

        ${function:C:\Source\TMGit\Chris.Hunt\pssummit2017-mocking\Demo2a-ScriptFiles.ps1}`
            = {Write-Output 'Testing'}

        $results = C:\Source\TMGit\Chris.Hunt\pssummit2017-mocking\Demo2a-ScriptFiles.ps1

        $results | Should Be 'Testing'

    }
}

