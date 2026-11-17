[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
try {
    $repoRoot = Split-Path -Parent $PSScriptRoot
    $entries = Get-Content -LiteralPath (Join-Path $repoRoot 'index.json') -Raw -Encoding UTF8 | ConvertFrom-Json
    $failed = 0
    $seen = @{}
    foreach ($entry in @($entries)) {
        try {
            if ([string]::IsNullOrWhiteSpace($entry.path) -or
                $entry.path -notmatch '^[^/\\:]+/[^/\\:]+$' -or
                $entry.path -match '(^|/)\.\.(/|$)') { throw 'Invalid relative path.' }
            if ($seen.ContainsKey($entry.path)) { throw 'Duplicate index path.' }
            $seen[$entry.path] = $true
            $file = Join-Path $repoRoot $entry.path
            if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { throw 'File missing.' }
            if ($entry.sha256 -notmatch '^[0-9a-fA-F]{64}$') { throw 'Invalid SHA-256.' }
            if ((Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash -ne $entry.sha256) { throw 'SHA-256 mismatch.' }
            if ((Get-Item -LiteralPath $file).Length -ne $entry.bytes) { throw 'Byte length mismatch.' }
        } catch {
            Write-Error ('{0}: {1}' -f $entry.path, $_.Exception.Message) -ErrorAction Continue
            $failed++
        }
    }
    if ($failed -gt 0) { exit 1 }
    Write-Output ('Verified {0} indexed files.' -f @($entries).Count)
    exit 0
} catch {
    Write-Error $_ -ErrorAction Continue
    exit 1
}
