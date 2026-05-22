function Write-PlatformLog {

    [CmdletBinding()]
    param (
        [string]$Message,

        [ValidateSet('Information','Warning','Error')]
        [string]$Level = 'Information'
    )

    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    $LogEntry = "[$Timestamp] [$Level] $Message"

    $LogDirectory = ".\logs"
    $LogPath = "$LogDirectory\platform.log"

    # Ensure log directory exists
    if (-not (Test-Path $LogDirectory)) {

        New-Item `
            -Path $LogDirectory `
            -ItemType Directory `
            -Force | Out-Null
    }

    Write-Output $LogEntry

    Add-Content -Path $LogPath -Value $LogEntry
}
