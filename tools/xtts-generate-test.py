from pathlib import Path

from TTS.api import TTS


ROOT = Path(__file__).resolve().parents[1]
REFERENCE = ROOT / "reference.wav"
OUT = ROOT / "xtts_test.wav"

if not REFERENCE.exists():
    raise SystemExit(f"Missing reference voice file: {REFERENCE}")

tts = TTS("tts_models/multilingual/multi-dataset/xtts_v2", gpu=True)
tts.tts_to_file(
    text="Ich bin noch nicht bereit.",
    speaker_wav=str(REFERENCE),
    language="de",
    file_path=str(OUT),
)

print(f"Wrote {OUT}")
