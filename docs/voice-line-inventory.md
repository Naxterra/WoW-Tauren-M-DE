# Voice line inventory

Use this file as the tracking sheet while building the German Tauren replacement set.

## Priority 1: player UI errors

| Key | German line | Replacement file | Blizzard FileDataID | Status |
| --- | --- | --- | --- | --- |
| `not_ready` | Ich bin noch nicht bereit. | `Sounds/male/error_not_ready_01.mp3` | TBD | Generated |
| `no_mana` | Ich habe nicht genug Mana. | `Sounds/male/error_no_mana_01.mp3` | TBD | Generated |
| `out_of_range` | Ich bin zu weit entfernt. | `Sounds/male/error_out_of_range_01.mp3` | TBD | Generated |
| `inventory_full` | Meine Taschen sind voll. | `Sounds/male/error_inventory_full_01.mp3` | TBD | Generated |

## Priority 2: emotes

| Key | Replacement file | Blizzard FileDataID | Status |
| --- | --- | --- | --- |
| `ROAR` | `Sounds/male/emote_roar_01.mp3` | TBD | Needs real sound effect |
| `TRAIN` | `Sounds/male/emote_train_01.mp3` | TBD | Generated |
| `CHARGE` | `Sounds/male/emote_charge_01.mp3` | TBD | Generated |
| `HELLO` / `hallo` | `Sounds/male/emote_hello_01.mp3` | 543029/543035/543074 | Needed |
| `BYE` / `tschuess` | `Sounds/male/emote_bye_01.mp3` | 543034/543061/543068 | Needed |
| `THANK` / `danke` | `Sounds/male/emote_thank_01.mp3` | 543039/543047/543060/543069 | Needed |
| `FLIRT` / `flirt` | `Sounds/male/emote_flirt_01.mp3` | 543031/543033/543037/543052/543064/543077 | Needed |
| `LAUGH` / `lachen` | `Sounds/male/emote_laugh_01.mp3` | 542898 | Needed |
| `CRY` / `weinen` | `Sounds/male/emote_cry_01.mp3` | 542887 | Needed |
| `KISS` / `kuss` | `Sounds/male/emote_kiss_01.mp3` | 542893 | Needed |
| `CHICKEN` / `huhn` | `Sounds/male/emote_chicken_01.mp3` | 542903 | Needed |
| `MOO` / `muh` | `Sounds/male/emote_moo_01.mp3` | 542894 | Needed |
| `SIGH` / `seufzen` | `Sounds/male/emote_sigh_01.mp3` | 542900 | Needed |
| `YAWN` / `gaehnen` | `Sounds/male/emote_yawn_01.mp3` | 542890 | Needed |

## Priority 3: lifecycle/combat

| Key | Replacement file | Blizzard FileDataID | Status |
| --- | --- | --- | --- |
| `PLAYER_DEAD` | `Sounds/male/death_01.mp3` | TBD | Generated |
| `PLAYER_ALIVE` | `Sounds/male/revive_01.mp3` | TBD | Generated |
| combat grunts | TBD | TBD | Research |

## FileDataID notes

Add only IDs that have been verified in game. A bad ID can mute an unrelated sound.

Suggested verification loop:

1. Find a candidate ID in wow.tools, Wowhead sounds, Leatrix Sounds, or a local CASC/listfile export.
2. Add exactly one candidate ID to the relevant `muteFileDataIDs` table.
3. `/reload`.
4. Trigger the matching Tauren line.
5. Keep the ID only if the original Blizzard voice is gone and unrelated sounds still play.
