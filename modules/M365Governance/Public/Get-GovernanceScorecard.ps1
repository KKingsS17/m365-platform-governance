function Get-GovernanceScorecard {

    [CmdletBinding()]
    param (
        [array]$Findings
    )

    $Total = $Findings.Count

    $High = ($Findings | Where-Object Severity -eq 'High').Count
    $Medium = ($Findings | Where-Object Severity -eq 'Medium').Count
    $Low = ($Findings | Where-Object Severity -eq 'Low').Count

    $Score = 100

    $Score -= ($High * 15)
    $Score -= ($Medium * 5)
    $Score -= ($Low * 1)

    if ($Score -lt 0) {
        $Score = 0
    }

    return [PSCustomObject]@{
        GovernanceScore = $Score
        TotalFindings   = $Total
        HighSeverity    = $High
        MediumSeverity  = $Medium
        LowSeverity     = $Low
    }
}
