function Get-TechnicalDebtReport {

    [CmdletBinding()]
    param (
        [array]$Findings
    )

    $DebtItems = $Findings | Where-Object {
        $_.Category -match 'Governance|Lifecycle|Drift'
    }

    return $DebtItems | Select-Object `
        Control,
        Severity,
        Resource,
        Recommendation,
        OperationalOwner
}
