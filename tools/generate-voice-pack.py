import argparse
import asyncio
from pathlib import Path

import edge_tts


VOICE_PACK = {
    "male": {
        "voice": "de-DE-ConradNeural",
        "rate": "-18%",
        "pitch": "-28Hz",
        "lines": {
            "error_not_ready_01.mp3": "Ich bin noch nicht bereit.",
            "error_no_mana_01.mp3": "Ich habe nicht genug Mana.",
            "error_out_of_range_01.mp3": "Ich bin zu weit entfernt.",
            "error_inventory_full_01.mp3": "Meine Taschen sind voll.",
            "emote_train_01.mp3": "Tschu tschuu.",
            "emote_charge_01.mp3": "Für die Horde!",
            "death_01.mp3": "Uuuhh...",
            "revive_01.mp3": "Ich stehe wieder.",
        },
    },
    "female": {
        "voice": "de-DE-KatjaNeural",
        "rate": "-14%",
        "pitch": "-18Hz",
        "lines": {
            "error_not_ready_01.mp3": "Ich bin noch nicht bereit.",
            "error_no_mana_01.mp3": "Ich habe nicht genug Mana.",
            "error_out_of_range_01.mp3": "Ich bin zu weit entfernt.",
            "error_inventory_full_01.mp3": "Meine Taschen sind voll.",
            "emote_train_01.mp3": "Tschu tschuu.",
            "emote_charge_01.mp3": "Für die Horde!",
            "death_01.mp3": "Uuuhh...",
            "revive_01.mp3": "Ich stehe wieder.",
        },
    },
}


async def generate_line(text, voice, rate, pitch, out_file):
    communicate = edge_tts.Communicate(
        text=text,
        voice=voice,
        rate=rate,
        pitch=pitch,
    )
    await communicate.save(str(out_file))


async def generate_pack(addon_dir):
    for sex, config in VOICE_PACK.items():
        out_dir = addon_dir / "Sounds" / sex
        out_dir.mkdir(parents=True, exist_ok=True)

        for filename, text in config["lines"].items():
            out_file = out_dir / filename
            print(f"{sex}/{filename}: {text}")
            await generate_line(
                text=text,
                voice=config["voice"],
                rate=config["rate"],
                pitch=config["pitch"],
                out_file=out_file,
            )


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--addon-dir",
        type=Path,
        default=Path("NaxVoiceDE"),
        help="Path to the NaxVoiceDE addon directory.",
    )
    args = parser.parse_args()
    asyncio.run(generate_pack(args.addon_dir))


if __name__ == "__main__":
    main()
