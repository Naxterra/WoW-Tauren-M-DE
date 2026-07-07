import math
import random
import struct
import wave
from pathlib import Path


SAMPLE_RATE = 44100


def envelope(t, duration):
    attack = 0.12
    release = 0.55
    if t < attack:
        return t / attack
    if t > duration - release:
        return max(0.0, (duration - t) / release)
    return 1.0


def make_roar(path, base_freq, duration, seed):
    random.seed(seed)
    frames = []
    phase1 = 0.0
    phase2 = 0.0
    phase3 = 0.0
    noise_state = 0.0

    for i in range(int(SAMPLE_RATE * duration)):
        t = i / SAMPLE_RATE
        env = envelope(t, duration)
        sweep = 1.0 + 0.18 * math.sin(2 * math.pi * 0.65 * t)
        vibrato = 1.0 + 0.035 * math.sin(2 * math.pi * 7.5 * t)
        freq = base_freq * sweep * vibrato

        phase1 += 2 * math.pi * freq / SAMPLE_RATE
        phase2 += 2 * math.pi * (freq * 0.51) / SAMPLE_RATE
        phase3 += 2 * math.pi * (freq * 1.97) / SAMPLE_RATE

        raw_noise = random.uniform(-1.0, 1.0)
        noise_state = 0.985 * noise_state + 0.015 * raw_noise
        breath = raw_noise * 0.18 + noise_state * 1.8

        tone = (
            math.sin(phase1) * 0.55
            + math.sin(phase2) * 0.70
            + math.sin(phase3) * 0.18
        )
        distortion = math.tanh((tone + breath) * 2.7)
        sample = distortion * env * 0.82
        frames.append(struct.pack("<h", int(max(-1.0, min(1.0, sample)) * 32767)))

    path.parent.mkdir(parents=True, exist_ok=True)
    with wave.open(str(path), "wb") as wav:
        wav.setnchannels(1)
        wav.setsampwidth(2)
        wav.setframerate(SAMPLE_RATE)
        wav.writeframes(b"".join(frames))


def main():
    addon_dir = Path("NaxVoiceDE")
    make_roar(addon_dir / "Sounds" / "male" / "emote_roar_01.wav", 58, 1.55, 1001)
    make_roar(addon_dir / "Sounds" / "female" / "emote_roar_01.wav", 72, 1.35, 2002)


if __name__ == "__main__":
    main()
