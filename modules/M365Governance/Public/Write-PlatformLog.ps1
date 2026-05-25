function Write-PlatformLog {

    [CmdletBinding()]
    param (
        [string]$Message,
        [string]$ExecutionId,
        [ValidateSet('Information','Warning','Error')]
        [string]$Level = 'Information'
    )

    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    if ($ExecutionId) {

        $LogEntry = "[$Timestamp] [$Level] [$ExecutionId] $Message"
    }
    else {

        $LogEntry = "[$Timestamp] [$Level] $Message"
    }

    $LogDirectory = ".\logs"
    $LogPath = "$LogDirectory\platform.log"

    # Ensure log directory exists
    if (-not (Test-Path $LogDirectory)) {

        New-Item `
            -Path $LogDirectory `
            -ItemType Directory `
            -Force | Out-Null
    }

    Write-Verbose $LogEntry

    Add-Content -Path $LogPath -Value $LogEntry
}
