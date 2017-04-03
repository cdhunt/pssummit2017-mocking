Describe Nodes {
    $URI = "http://localhost:8001"
    Start-Job -Name ApiMocks -FilePath .\Demo4a.ps1

    Context "Verify Flancy Server is running" {
        It "Should respond" {
            $results = Invoke-RestMethod $URI
            $results | Should Be "Api Mocks"
        }
    }

    Stop-Job -Name ApiMocks
    Remove-Job -Name ApiMocks
}

