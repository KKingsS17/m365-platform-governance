function Invoke-TeamsGovernanceAssessment {

    [CmdletBinding()]
    param (
        [ValidateSet('dev','test','prod')]
        [string]$Environment = 'prod'
    )

    Write-PlatformLog -Message "Starting Teams governance assessment"

    $Config = Get-TenantBaseline -Environment $Environment

    $Teams = Get-TeamsDataset

    $Inventory = Get-TeamsInventory -Teams $Teams

    $InactiveTeams = Get-InactiveTeams `
        -Teams $Teams `
        -InactiveDays $Config.GovernanceStandards.TeamsInactiveThresholdDays

    $Findings = @()

    $Findings += Get-OrphanedTeams -Teams $Teams
    $Findings += Test-TeamsNamingPolicy `
        -Config $Config `
        -Teams $Teams

    return [PSCustomObject]@{
        Inventory      = $Inventory
        InactiveTeams  = $InactiveTeams
        Findings       = $Findings
    }
}
