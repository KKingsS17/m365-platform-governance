function Write-RemediationLog {

    param (
        [string]$Resource,
        [string]$Action
    )

    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    $Entry = [PSCustomObject]@{
        Timestamp = $Timestamp
        Resource  = $Resource
        Action    = $Action
    }

    $Entry | Export-Csv `
        -Path ".\logs\remediation-log.csv" `
        -Append `
        -NoTypeInformation `
        -Force
}
