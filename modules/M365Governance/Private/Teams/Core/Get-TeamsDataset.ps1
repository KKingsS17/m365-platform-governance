function Get-TeamsDataset {

    [CmdletBinding()]
    param ()

    Write-PlatformLog `
        -Message "Collecting Teams operational dataset"

    $Teams = Get-MgGroup `
        -Filter "resourceProvisioningOptions/Any(x:x eq 'Team')" `
        -All

    return $Teams
}
