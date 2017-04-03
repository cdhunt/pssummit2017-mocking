Import-Module flancy
$url = "http://localhost:8001"
New-Flancy -url $url -webschema @(
    Get '/' { "Api Mocks" }

    Post '/nodes/' {
        try {
            $body = (New-Object System.IO.StreamReader @($Request.Body, [System.Text.Encoding]::UTF8)).ReadToEnd()
            [PSCustomObject]@{Path=$Request.Path
                Headers=$Request.Headers
                Query=$Request.Query
                Method=$Request.Method
                Body=$body} |
            ConvertTo-Json -depth 2 }
        catch { $Error } }
)
Start-Sleep -Seconds 1
PING.EXE localhost -t

