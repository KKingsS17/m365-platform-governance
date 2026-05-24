function Test-GuestAccessGovernance {

    param (
        $Config
    )

    Write-PlatformLog -Message "Running guest access governance validation"

    $Findings = @()

    $Guests = Get-MgUser -Filter "userType eq 'Guest'"

    foreach ($Guest in $Guests) {

        $Findings += [GovernanceFinding]::new(
            "Guest Account Review",
            "Guest Governance",
            "Medium",
            "Review",
            $Guest.DisplayName,
            "Guest account requires governance review",
            "Validate guest business justification and remove stale guest accounts",
            "Identity and Access Management Team"
        )
    }

    return $Findings
}
