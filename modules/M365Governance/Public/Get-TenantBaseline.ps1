function Get-TenantBaseline {

    [CmdletBinding()]
    param (
        [string]$ConfigPath = ".\config\tenant-baseline.json"
    )

    Write-PlatformLog -Message "Loading tenant baseline configuration"

    $Config = Get-ConfigFile -Path $ConfigPath

    return $Config
}
