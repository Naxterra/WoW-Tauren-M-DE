import argparse
import json
import os
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path


API_URL = "https://api.elevenlabs.io/v1/text-to-speech/{voice_id}"


def post_tts(api_key, voice_id, model_id, output_format, text, voice_settings):
    query = urllib.parse.urlencode({"output_format": output_format})
    url = f"{API_URL.format(voice_id=urllib.parse.quote(voice_id))}?{query}"
    body = {
        "text": text,
        "model_id": model_id,
        "voice_settings": voice_settings,
    }
    request = urllib.request.Request(
        url,
        data=json.dumps(body).encode("utf-8"),
        headers={
            "xi-api-key": api_key,
            "Content-Type": "application/json",
            "Accept": "audio/mpeg",
        },
        method="POST",
    )
    with urllib.request.urlopen(request, timeout=120) as response:
        return response.read()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", default="voice-lines/tauren-male-elevenlabs.json")
    parser.add_argument("--out-dir", default=r"C:\Users\nxkt\Downloads\ElevenLabsTauren")
    parser.add_argument("--voice-id", default=os.getenv("ELEVENLABS_VOICE_ID"))
    parser.add_argument("--api-key", default=os.getenv("ELEVENLABS_API_KEY"))
    parser.add_argument("--model-id", default=os.getenv("ELEVENLABS_MODEL_ID", "eleven_v3"))
    parser.add_argument("--output-format", default="mp3_44100_128")
    parser.add_argument("--skip-existing", action="store_true")
    parser.add_argument("--limit", type=int, default=0)
    args = parser.parse_args()

    if not args.api_key:
        raise SystemExit("Missing API key. Set ELEVENLABS_API_KEY or pass --api-key.")
    if not args.voice_id:
        raise SystemExit("Missing voice id. Set ELEVENLABS_VOICE_ID or pass --voice-id.")

    manifest_path = Path(args.manifest)
    out_dir = Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    voice_settings = manifest.get("voice_settings", {})
    lines = manifest["lines"]
    if args.limit > 0:
        lines = lines[: args.limit]

    for index, line in enumerate(lines, 1):
        out_file = out_dir / line["filename"]
        if args.skip_existing and out_file.exists():
            print(f"[{index}/{len(lines)}] skip existing {out_file.name}")
            continue

        print(f"[{index}/{len(lines)}] generating {out_file.name}")
        try:
            audio = post_tts(
                api_key=args.api_key,
                voice_id=args.voice_id,
                model_id=args.model_id,
                output_format=args.output_format,
                text=line["text"],
                voice_settings=voice_settings,
            )
        except urllib.error.HTTPError as exc:
            detail = exc.read().decode("utf-8", errors="replace")
            raise SystemExit(f"ElevenLabs error {exc.code} for {out_file.name}: {detail}") from exc

        out_file.write_bytes(audio)
        time.sleep(0.35)

    print(f"Wrote files to {out_dir}")


if __name__ == "__main__":
    main()
