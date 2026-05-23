Describe 'M365Governance Module Tests' {

    BeforeAll {

        Import-Module `
            "$PSScriptRoot/../modules/M365Governance/M365Governance.psd1" `
            -Force
    }

    It 'Should import module successfully' {

        Get-Module M365Governance | Should -Not -BeNullOrEmpty
    }

    It 'Should load Connect-M365Platform function' {

        Get-Command Connect-M365Platform | Should -Not -BeNullOrEmpty
    }

    It 'Should load Invoke-GovernanceAudit function' {

        Get-Command Invoke-GovernanceAudit | Should -Not -BeNullOrEmpty
    }
}
