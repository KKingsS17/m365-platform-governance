function Connect-M365Platform {

    [CmdletBinding()]
    param ()

    try {

        Write-PlatformLog -Message "Connecting to Microsoft Graph"

        Connect-MgGraph `
            -Scopes @(
                "Directory.Read.All",
                "Group.Read.All",
                "User.Read.All",
                "Sites.Read.All"
            )

        Write-PlatformLog -Message "Microsoft Graph connection established"
    }
    catch {

        Write-PlatformLog `
            -Message "Failed to connect to Microsoft Graph: $_" `
            -Level Error

        throw
    }
}
