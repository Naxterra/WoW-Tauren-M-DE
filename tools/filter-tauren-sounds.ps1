param(
    [Parameter(Mandatory = $true)]
    [string] $ListFile,

    [string] $OutFile = ".\tauren-sound-candidates.tsv",

    [switch] $IncludeNonSound
)

$terms = @(
    "tauren",
    "taurenmale",
    "taurenfemale",
    "vo_tauren",
    "character\tauren",
    "sound\creature\tauren"
)

if (-not (Test-Path -LiteralPath $ListFile)) {
    throw "List file not found: $ListFile"
}

$rows = Get-Content -LiteralPath $ListFile | Where-Object {
    $line = $_.ToLowerInvariant()
    if (-not $IncludeNonSound -and $line -notmatch '\.(ogg|mp3|wav)$') {
        return $false
    }

    $matched = $false
    foreach ($term in $terms) {
        if ($line.Contains($term)) {
            $matched = $true
            break
        }
    }
    return $matched
}

$rows | Set-Content -LiteralPath $OutFile -Encoding UTF8
Write-Host "Wrote $($rows.Count) candidate rows to $OutFile"
