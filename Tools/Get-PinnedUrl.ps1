[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[A-Za-z0-9](?:[A-Za-z0-9-]{0,38})$')]
    [string]$Owner,
    [string]$Commit
)

$ErrorActionPreference = 'Stop'
try {
    $repoRoot = Split-Path -Parent $PSScriptRoot
    if ([string]::IsNullOrWhiteSpace($Commit)) {
        $Commit = & git -C $repoRoot rev-parse HEAD
        if ($LASTEXITCODE -ne 0) { throw 'Cannot resolve HEAD.' }
    }
    if ($Commit -notmatch '^[0-9a-fA-F]{40}$') {
        throw 'Commit must be a full 40-character commit SHA.'
    }
    $entries = Get-Content -LiteralPath (Join-Path $repoRoot 'index.json') -Raw -Encoding UTF8 | ConvertFrom-Json
    foreach ($entry in @($entries)) {
        $encodedPath = (($entry.path -split '/' | ForEach-Object { [Uri]::EscapeDataString($_) }) -join '/')
        'https://raw.githubusercontent.com/{0}/rimmod-workshop-assets/{1}/{2}' -f $Owner, $Commit.ToLowerInvariant(), $encodedPath
    }
} catch {
    Write-Error $_ -ErrorAction Continue
    exit 1
}
