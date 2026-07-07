# NaxVoiceDE

NaxVoiceDE is a World of Warcraft addon scaffold for a German Tauren voice replacement project.

The addon keeps the German client intact. It mutes verified internal Tauren voice FileDataIDs with `MuteSoundFile` and plays replacement MP3 files from the addon folder with `PlaySoundFile`.

## Current state

- Working addon structure.
- AI-generated first-pass MP3 voice pack.
- German Tauren male and female data tables.
- Slash-command test harness.
- UI error replay hooks for common German error messages.
- Emote replay hook through `DoEmote`.
- Death/revive replay events.
- Empty mute tables waiting for verified German Tauren FileDataIDs.
- Curated Tauren FileDataID candidates from the current wowdev listfile in `docs/tauren-filedataid-candidates.md`.

## Install

Copy the `NaxVoiceDE` folder into:

```text
World of Warcraft/_retail_/Interface/AddOns/
```

Then restart WoW or run `/reload`.

## Commands

```text
/naxvoice status
/naxvoice on
/naxvoice off
/naxvoice mute
/naxvoice unmute
/naxvoice remute
/naxvoice scope player
/naxvoice scope tauren
/naxvoice test ready
/naxvoice test mana
/naxvoice test roar
/naxvoice play Sounds/male/error_not_ready_01.mp3
/naxvoice debug
```

## Workflow

1. Generate or record a replacement line into `NaxVoiceDE/Sounds/male` or `NaxVoiceDE/Sounds/female`.
2. Add the sound path to `TaurenMale_DE.lua` or `TaurenFemale_DE.lua`.
3. Find and verify the matching Blizzard German Tauren FileDataID.
4. Add the FileDataID to the relevant `muteFileDataIDs` table.
5. Test in game with `/reload`, `/naxvoice status`, and the relevant emote/error.

Start with `docs/voice-direction.md` for the recording brief and `docs/voice-line-inventory.md` for the replacement checklist.

## Important limit

WoW addons cannot replace Blizzard sound files directly. This project is intentionally built as a mute-and-replay addon. It can work well for player UI voice lines and emotes, but exact one-to-one replacement of every internal combat grunt depends on finding the right FileDataIDs and accepting that some playback timing is controlled by the engine.

## Audio attribution

Voice audio in this repository was generated with ElevenLabs. elevenlabs.io
