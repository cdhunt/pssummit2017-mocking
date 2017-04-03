# Doesn't work
$ps = New-Object -TypeName Diagnostics.Process -Property @{Name = "IMadeItUp.exe"
                                                           ID = 321
                                                           CPU = 50
                                                           WorkingSet = 1MB}

# But we can use PowerShell's Dynamic Type System
$ps = New-Object -TypeName Diagnostics.Process |
    Add-Member -MemberType ScriptProperty -Name ProcessName -Value {"IMadeItUp.exe"} -Force -PassThru |
    Add-Member -MemberType ScriptProperty -Name ID -Value {321} -Force -PassThru |
    Add-Member -MemberType ScriptMethod -Name Kill -Value {"Killed $($this.id)"} -Force -PassThru

$ps
$ps.kill()
