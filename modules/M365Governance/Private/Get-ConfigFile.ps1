function Get-ConfigFile {

    [CmdletBinding()]
    param (
        [string]$Path
    )

    if (-not (Test-Path $Path)) {
        throw "Configuration file not found: $Path"
    }

    try {
        return Get-Content $Path -Raw | ConvertFrom-Json
    }
    catch {
        throw "Failed to parse configuration file: $_"
    }
}
