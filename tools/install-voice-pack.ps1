param(
    [Parameter(Mandatory = $true)]
    [string] $SourceDir,

    [ValidateSet("male", "female")]
    [string] $Sex = "male",

    [string] $AddonDir = ".\NaxVoiceDE",

    [string] $WowAddonDir = "E:\BNet Spiele\World of Warcraft\_retail_\Interface\AddOns\NaxVoiceDE"
)

$required = @(
    "error_not_ready_01.mp3",
    "error_no_mana_01.mp3",
    "error_out_of_range_01.mp3",
    "error_inventory_full_01.mp3",
    "emote_charge_01.mp3",
    "emote_train_01.mp3",
    "death_01.mp3",
    "revive_01.mp3"
)

$optional = @(
    "emote_roar_01.mp3",
    "emote_hello_01.mp3",
    "emote_bye_01.mp3",
    "emote_thank_01.mp3",
    "emote_flirt_01.mp3",
    "emote_laugh_01.mp3",
    "emote_cry_01.mp3",
    "emote_kiss_01.mp3",
    "emote_chicken_01.mp3",
    "emote_moo_01.mp3",
    "emote_sigh_01.mp3",
    "emote_yawn_01.mp3",
    "emote_cheer_01.mp3",
    "emote_congratulate_01.mp3",
    "emote_yes_01.mp3",
    "emote_no_01.mp3",
    "emote_help_01.mp3",
    "emote_followme_01.mp3",
    "emote_wait_01.mp3",
    "emote_incoming_01.mp3",
    "emote_flee_01.mp3",
    "emote_openfire_01.mp3",
    "emote_attackmytarget_01.mp3",
    "emote_healme_01.mp3",
    "emote_outofmana_01.mp3",
    "emote_welcome_01.mp3",
    "emote_raspberry_01.mp3",
    "emote_angry_01.mp3",
    "emote_oops_01.mp3",
    "emote_sorry_01.mp3",
    "emote_taunt_01.mp3",
    "emote_threaten_01.mp3",
    "emote_whoa_01.mp3"
)

if (-not (Test-Path -LiteralPath $SourceDir)) {
    throw "Source directory not found: $SourceDir"
}

$localTarget = Join-Path $AddonDir "Sounds\$Sex"
$wowTarget = Join-Path $WowAddonDir "Sounds\$Sex"
New-Item -ItemType Directory -Force -Path $localTarget, $wowTarget | Out-Null

$missing = @()
foreach ($name in $required) {
    $source = Join-Path $SourceDir $name
    if (-not (Test-Path -LiteralPath $source)) {
        $missing += $name
        continue
    }

    Copy-Item -LiteralPath $source -Destination (Join-Path $localTarget $name) -Force
    Copy-Item -LiteralPath $source -Destination (Join-Path $wowTarget $name) -Force
}

if ($missing.Count -gt 0) {
    Write-Warning "Missing files:"
    $missing | ForEach-Object { Write-Warning "  $_" }
} else {
    Write-Host "Installed $($required.Count) $Sex voice files into the project and WoW addon folder."
}

foreach ($name in $optional) {
    $source = Join-Path $SourceDir $name
    if (Test-Path -LiteralPath $source) {
        Copy-Item -LiteralPath $source -Destination (Join-Path $localTarget $name) -Force
        Copy-Item -LiteralPath $source -Destination (Join-Path $wowTarget $name) -Force
        Write-Host "Installed optional $Sex file: $name"
    }
}
