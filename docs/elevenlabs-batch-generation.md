# ElevenLabs batch generation

Use this when you want separate MP3 files in one run.

## Setup

Get your API key from ElevenLabs and set it for the current PowerShell session:

```powershell
$env:ELEVENLABS_API_KEY = "paste-key-here"
```

Set the voice ID for the voice you want to use:

```powershell
$env:ELEVENLABS_VOICE_ID = "paste-voice-id-here"
```

Do not commit or share the API key.

## Generate all missing Tauren male emote files

```powershell
cd "D:\OneDrive\Dokumente\WoW German Sound Addon"
python tools\generate-elevenlabs-pack.py --skip-existing
.\tools\install-voice-pack.ps1 -SourceDir "C:\Users\nxkt\Downloads\ElevenLabsTauren" -Sex male
```

## Test a smaller run first

```powershell
python tools\generate-elevenlabs-pack.py --limit 2
```

This writes separate MP3 files to:

```text
C:\Users\nxkt\Downloads\ElevenLabsTauren
```

The manifest is:

```text
voice-lines/tauren-male-elevenlabs.json
```
