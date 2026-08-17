#requires -version 7.0

param(
    [CmdletBinding()]
        [switch]$Help,

        [Parameter(mandatory = $false)]
        [ValidateSet("DryRun", "Standard")]
        [string]$Mode = 'DryRun'
)

Set-StrictMode -Version Latest

# Set Error Action to Silently Continue
$ErrorActionPreference = "Stop"

if ($Help -eq $true) {
    Write-Host "Usage: .\release.ps1 [-Mode <DryRun|Standard>]"
    Write-Host "  -Mode: defaults to 'DryRun'"
    exit
}

$SemanticReleaseParams = [string[]]@()

If ($Mode -eq 'DryRun') {
    $SemanticReleaseParams += '--dry-run'
}

npx --package=semantic-release@25 --package=@semantic-release/commit-analyzer@13 --package=@semantic-release/release-notes-generator@14 --package=conventional-changelog-conventionalcommits@9 --package=@semantic-release/changelog@7 --package=@semantic-release/git@11 semantic-release $SemanticReleaseParams