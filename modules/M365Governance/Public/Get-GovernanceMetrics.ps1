function Get-GovernanceMetrics {

    param (
        [array]$Findings
    )

    return [PSCustomObject]@{

        TotalFindings = $Findings.Count
        HighSeverity = ($Findings | Where-Object Severity -eq 'High').Count
        MediumSeverity = ($Findings | Where-Object Severity -eq 'Medium').Count
        LowSeverity = ($Findings | Where-Object Severity -eq 'Low').Count
    }
}
