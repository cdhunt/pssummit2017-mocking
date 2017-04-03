$scriptblock = {param([bool]$testing)
    if ($testing) {
        Write-Output 'TestHostName'
    }
    else {
        HOSTNAME
    }
}

Invoke-Command -ScriptBlock $scriptblock

Invoke-Command -ScriptBlock $scriptblock -ArgumentList $true