# Voice direction

Goal: German Tauren player voice, deeper and calmer than the current client voice, without turning it into English audio or copying another actor.

## Performance notes

- Very low chest resonance, but intelligible.
- Slow attack on words; avoid rushed UI-error delivery.
- Dry, close-mic recording with little room tone.
- Keep most UI lines under 1.2 seconds.
- Keep combat barks short enough that several can overlap without turning muddy.

## First replacement lines

| Key | German line | Direction |
| --- | --- | --- |
| `not_ready` | Ich bin noch nicht bereit. | Low, restrained annoyance. |
| `no_mana` | Ich habe nicht genug Mana. | Matter-of-fact, no panic. |
| `out_of_range` | Ich bin zu weit entfernt. | Firm, clipped ending. |
| `inventory_full` | Meine Taschen sind voll. | Slight exhale before the line. |
| `ROAR` | No words. | Deep roar, short tail. |
| `TRAIN` | No words. | Heavy comic train call, not shrill. |
| `CHARGE` | Fuer die Horde! | Barked, half a second of grit. |
| `PLAYER_DEAD` | No words. | Heavy fall/death exhale. |
| `PLAYER_ALIVE` | Ich stehe wieder. | Quiet, grounded recovery. |
