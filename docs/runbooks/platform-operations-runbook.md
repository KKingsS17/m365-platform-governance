# Platform Operations Runbook

## Purpose

This runbook defines the operational procedures for executing Microsoft 365 governance audits, validating tenant standards, generating governance reports, and reviewing operational findings within the M365 Platform Governance Framework.

---

# Operational Scope

This runbook applies to:

- Governance validation operations
- Tenant hygiene assessments
- Operational reporting
- Governance drift analysis
- Lifecycle management reviews

Out of scope:

- End-user support
- Licensing operations
- Security incident response
- Interactive troubleshooting

---

# Platform Components

| Component         | Purpose               |
| ----------------- | --------------------- |
| Microsoft Graph   | Tenant data retrieval |
| PowerShell 7      | Automation runtime    |
| Governance Module | Audit orchestration   |
| Reporting Engine  | Operational reporting |
| Logging Framework | Operational logging   |

---

# Prerequisites

## Required Software

- PowerShell 7
- Git
- Microsoft Graph PowerShell SDK

## Required Permissions

The executing account must have:

- Directory.Read.All
- Group.Read.All
- User.Read.All
- Sites.Read.All

## Required Repository Structure

```text
m365-platform-governance/
├── config/
├── logs/
├── reports/
├── modules/
└── tests/
```

---

# Governance Audit Execution

## Step 1 — Import Platform Module

```powershell
Import-Module .\modules\M365Governance\M365Governance.psd1 -Force
```

Expected result:
- Module imports successfully
- Public functions become available

Validation command:

```powershell
Get-Command -Module M365Governance
```

---

## Step 2 — Authenticate to Microsoft Graph

```powershell
Connect-M365Platform
```

Expected result:
- Interactive authentication prompt
- Successful Graph connection established
- Logging entries written to platform.log

Validation command:

```powershell
Get-MgContext
```

---

## Step 3 — Execute Governance Audit

```powershell
$Findings = Invoke-GovernanceAudit
```

Expected result:
- Governance findings returned
- Audit validation completed
- Operational logs generated

---

## Step 4 — Generate Governance Reports

### CSV Report

```powershell
Export-GovernanceReport -Findings $Findings
```

### HTML Report

```powershell
Export-HtmlGovernanceReport -Findings $Findings
```

Expected output location:

```text
.\reports\
```

---

# Governance Findings Review

## Severity Classification

| Severity | Description                       |
| -------- | --------------------------------- |
| High     | Immediate governance risk         |
| Medium   | Operational review required       |
| Low      | Informational or lifecycle review |

---

# Logging & Monitoring

## Log File Location

```text
.\logs\platform.log
```

## Log Validation

Review recent entries:

```powershell
Get-Content .\logs\platform.log -Tail 20
```

---

# Troubleshooting

## Microsoft Graph Authentication Failure

Possible causes:
- Missing Graph permissions
- Expired authentication token
- MFA interruption

Validation steps:

```powershell
Get-MgContext
```

---

## Module Import Failure

Validation:

```powershell
Test-Path .\modules\M365Governance\
```

Corrective actions:
- Verify repository structure
- Re-import module
- Validate execution policy

---

## Governance Audit Failure

Validation steps:
- Review platform logs
- Validate Graph connectivity
- Confirm required scopes
- Test individual audit functions

---

# Operational Review Process

After audit completion:

1. Review High severity findings
2. Validate governance drift findings
3. Assign remediation ownership
4. Export operational reports
5. Archive audit outputs

---

# Remediation Workflow

Governance findings requiring remediation should:

- Be documented
- Assigned operational ownership
- Be validated after remediation
- Be re-tested during subsequent audit cycles

---

# CI/CD Validation

The platform includes automated validation for:

- PSScriptAnalyzer
- Pester testing
- Module import validation
- GitHub Actions CI pipeline

Validation occurs automatically during:
- Pull requests
- Branch updates
- Main branch merges
