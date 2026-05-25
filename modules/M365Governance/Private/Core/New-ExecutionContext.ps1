function New-ExecutionContext {

    [CmdletBinding()]
    param (

        [ValidateSet('dev','test','prod')]
        [string]$Environment = 'prod'
    )

    Write-PlatformLog `
        -Message "Initializing governance execution context"

    return [PSCustomObject]@{
        ExecutionId     = [guid]::NewGuid().Guid
        Environment     = $Environment
        StartTime       = Get-Date
        TenantConfig    = Get-TenantBaseline `
                              -Environment $Environment
        TeamsDataset    = $null
        Inventory       = $null
        InactiveTeams   = $null
        Findings        = @()
        Metrics         = $null
        Reports         = @()
        ExecutionStatus = "Initialized"
    }
}
