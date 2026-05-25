function Invoke-TeamsGovernanceAssessment {

    [CmdletBinding()]
    param (

        [ValidateSet('dev','test','prod')]
        [string]$Environment = 'prod'
    )

    $Context = New-ExecutionContext `
        -Environment $Environment

    Write-PlatformLog `
        -Message "Starting Teams governance assessment" `
        -ExecutionId $Context.ExecutionId

    $Context.TeamsDataset = Get-TeamsDataset

    $Context.Inventory = Get-TeamsInventory `
        -Context $Context

    $Context.InactiveTeams = Get-InactiveTeams `
        -Context $Context `
        -InactiveDays `
            $Context.TenantConfig.GovernanceStandards.TeamsInactiveThresholdDays

    $Context.Findings += Get-OrphanedTeams `
        -Context $Context

    $Context.Findings += Test-TeamsNamingPolicy `
        -Context $Context

    $Context.Metrics = Get-GovernanceScorecard `
        -Findings $Context.Findings

    $Context.ExecutionStatus = "Completed"

    Export-TeamsGovernanceReport `
    -Context $Context

    return $Context
}
