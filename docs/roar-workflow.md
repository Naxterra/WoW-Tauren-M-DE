# Roar workflow

The procedural roar was removed from the active mapping because it sounded like loud noise instead of a creature roar.

Use a real generated/downloaded sound effect instead.

## Required filename

For male Tauren:

```text
NaxVoiceDE/Sounds/male/emote_roar_01.mp3
```

## ElevenLabs sound effect prompt

Use Sound Effects, not Text to Speech, if your ElevenLabs account allows it:

```text
Deep fantasy minotaur warrior roar, huge chest resonance, guttural, organic animal throat, short aggressive battle roar, no words, no human speech, no music, dry close sound, game voice effect
```

Keep it under 2 seconds.

## Audacity cleanup

1. Trim silence.
2. Fade out the last 100-200 ms.
3. Normalize to around `-4 dB`.
4. Export as `emote_roar_01.mp3`.

After exporting, run:

```powershell
Copy-Item -LiteralPath "C:\Users\nxkt\Downloads\ElevenLabsTauren\emote_roar_01.mp3" -Destination "D:\OneDrive\Dokumente\WoW German Sound Addon\NaxVoiceDE\Sounds\male\emote_roar_01.mp3" -Force
Copy-Item -LiteralPath "C:\Users\nxkt\Downloads\ElevenLabsTauren\emote_roar_01.mp3" -Destination "E:\BNet Spiele\World of Warcraft\_retail_\Interface\AddOns\NaxVoiceDE\Sounds\male\emote_roar_01.mp3" -Force
```
