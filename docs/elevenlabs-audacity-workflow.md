# ElevenLabs and Audacity workflow

Use ElevenLabs for spoken German lines, then use Audacity for trimming and cleanup.

For less robotic results, use `docs/elevenlabs-tauren-v3-prompts.md` and regenerate only one or two test files before making the full pack.

## ElevenLabs settings

Pick or create a deep German male voice. Do not use an actor, streamer, or real person unless you have permission.

Good direction text:

```text
Deep German Tauren warrior voice. Low chest resonance, calm, older, heavy, restrained. Not theatrical. Not cartoon. Short delivery. Slight growl, but words must stay clear.
```

Export MP3 or WAV. MP3 works in WoW and is fine for these short addon sounds.

## Required male filenames

Put exported files in a staging folder with exactly these names:

```text
error_not_ready_01.mp3
error_no_mana_01.mp3
error_out_of_range_01.mp3
error_inventory_full_01.mp3
emote_charge_01.mp3
emote_train_01.mp3
death_01.mp3
revive_01.mp3
```

The roar should stay as `emote_roar_01.wav` from the procedural generator unless you create a real creature roar/sound effect.

## German prompts

| Filename | Text |
| --- | --- |
| `error_not_ready_01.mp3` | Ich bin noch nicht bereit. |
| `error_no_mana_01.mp3` | Ich habe nicht genug Mana. |
| `error_out_of_range_01.mp3` | Ich bin zu weit entfernt. |
| `error_inventory_full_01.mp3` | Meine Taschen sind voll. |
| `emote_charge_01.mp3` | Für die Horde! |
| `emote_train_01.mp3` | Tschu tschuu. |
| `death_01.mp3` | Uuuhh... |
| `revive_01.mp3` | Ich stehe wieder. |

## Audacity cleanup

1. Trim silence at the start.
2. Leave a tiny tail at the end so it does not cut off unnaturally.
3. Normalize peak to around `-3 dB`.
4. If too bright, lower pitch by 2-4 semitones.
5. Export using the required filename.

Keep UI error lines short. WoW can trigger them often, and long files will feel messy.
