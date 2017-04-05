$scriptblock = {param([bool]$testing)
    if ($testing) {
        Write-Output 'TestHostName'
    }
    else {
        HOSTNAME
    }
}

Invoke-Command -ComputerName SomeSystem -ScriptBlock $scriptblock

Invoke-Command -ComputerName SomeSystem -ScriptBlock $scriptblock -ArgumentList $true