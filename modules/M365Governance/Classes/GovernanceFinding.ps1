class GovernanceFinding {

    [string]$Control
    [string]$Category
    [string]$Severity
    [string]$Status
    [string]$Resource
    [string]$Message
    [datetime]$Timestamp

    GovernanceFinding (
        [string]$Control,
        [string]$Category,
        [string]$Severity,
        [string]$Status,
        [string]$Resource,
        [string]$Message
    ) {
        $this.Control = $Control
        $this.Category = $Category
        $this.Severity = $Severity
        $this.Status = $Status
        $this.Resource = $Resource
        $this.Message = $Message
        $this.Timestamp = Get-Date
    }
}
