function Get-GovernanceExecutionSummary {

    [CmdletBinding()]
    param (
        $Context
    )

    return [PSCustomObject]@{
        ExecutionId        = $Context.ExecutionId
        Environment        = $Context.Environment
        StartTime          = $Context.StartTime
        ExecutionStatus    = $Context.ExecutionStatus
        TeamsDiscovered    = $Context.TeamsDataset.Count
        TotalFindings      = $Context.Findings.Count
        GovernanceScore    = $Context.Metrics.GovernanceScore
    }
}
