# ElevenLabs Tauren v3 prompts

The current files sound robotic because they are being delivered like normal TTS narration. For this project, generate one test line at a time using Eleven v3 if it is available on your plan.

Use a designed/original voice, not a locked library voice and not a real actor clone.

## Voice Design prompt

```text
Massive older German fantasy minotaur warrior. Very deep chest resonance, rough organic throat, slow deliberate delivery, grounded and intimidating, worn veteran, calm anger under the surface. Not seductive. Not a narrator. Not robotic. Not cartoon. Short game character voice lines.
```

If ElevenLabs offers sliders during voice design:

```text
Gender: male
Age: older adult
Accent: German
Pitch: very low
Pace: slow
Tone: dark, rough, restrained
```

## Text to Speech settings

Start here, then adjust:

```text
Model: Eleven v3, if available
Mode: Creative or Natural
Stability: 25-35
Similarity: 55-70
Style Exaggeration: 40-65
Speed: 0.85-0.92
Speaker Boost: on
```

If the result glitches, raise Stability toward `45`.
If the result is flat/robotic, lower Stability or increase Style Exaggeration.
If it sounds too human-clean, lower pitch slightly in Audacity after export.

## Generate these as tests first

Do not regenerate the whole pack yet. Start with these two:

```text
[low growl] Ich bin noch nicht bereit.
```

```text
[short angry battle shout] Für die Horde!
```

If those are good, continue with the rest.

## Full prompt set

| Filename | Prompt |
| --- | --- |
| `error_not_ready_01.mp3` | `[low growl] Ich bin noch nicht bereit.` |
| `error_no_mana_01.mp3` | `[frustrated, low voice] Ich habe nicht genug Mana.` |
| `error_out_of_range_01.mp3` | `[stern, slow] Ich bin zu weit entfernt.` |
| `error_inventory_full_01.mp3` | `[annoyed exhale] Meine Taschen sind voll.` |
| `emote_charge_01.mp3` | `[short angry battle shout] Für die Horde!` |
| `emote_train_01.mp3` | `[deep amused rumble] Tschu tschuu.` |
| `death_01.mp3` | `[heavy wounded exhale] Uuuhh...` |
| `revive_01.mp3` | `[quiet, grim] Ich stehe wieder.` |

## Audacity pass

After export:

1. Trim silence.
2. Pitch down by 2 semitones only if it still sounds too human.
3. Add a tiny fade out at the end.
4. Normalize to around `-3 dB`.

Do not over-process. Too much pitch shift is what turns the voice into a bad robot.
