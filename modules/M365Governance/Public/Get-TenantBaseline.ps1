function Get-TenantBaseline {

    [CmdletBinding()]
    param (
        [ValidateSet('dev','test','prod')]
        [string]$Environment = 'prod'
    )

    $ConfigPath = ".\config\tenant-baseline.$Environment.json"

    Write-PlatformLog `
        -Message "Loading tenant baseline configuration for environment: $Environment"

    $Config = Get-ConfigFile -Path $ConfigPath

    return $Config
}
