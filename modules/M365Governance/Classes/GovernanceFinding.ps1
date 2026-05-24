class GovernanceFinding {

    [string]$Control
    [string]$Category
    [string]$Severity
    [string]$Status
    [string]$Resource
    [string]$Message
    [string]$Recommendation
    [string]$OperationalOwner
    [datetime]$Timestamp

    GovernanceFinding (
        [string]$Control,
        [string]$Category,
        [string]$Severity,
        [string]$Status,
        [string]$Resource,
        [string]$Message,
        [string]$Recommendation,
        [string]$OperationalOwner
    ) {

        $this.Control = $Control
        $this.Category = $Category
        $this.Severity = $Severity
        $this.Status = $Status
        $this.Resource = $Resource
        $this.Message = $Message
        $this.Recommendation = $Recommendation
        $this.OperationalOwner = $OperationalOwner
        $this.Timestamp = Get-Date
    }
}
