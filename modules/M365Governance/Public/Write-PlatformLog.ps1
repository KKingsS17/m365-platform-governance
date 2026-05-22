function Write-PlatformLog {

    [CmdletBinding()]
    param (
        [string]$Message,

        [ValidateSet('Information','Warning','Error')]
        [string]$Level = 'Information'
    )

    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    $LogEntry = "[$Timestamp] [$Level] $Message"

    Write-Output $LogEntry

    Add-Content -Path ".\logs\platform.log" -Value $LogEntry
}
