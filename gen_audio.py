import wave
import math
import struct

def generate_tone(filename, freqs, durations, volume=0.5):
    sample_rate = 44100.0
    with wave.open(filename, 'w') as wav_file:
        wav_file.setnchannels(1)
        wav_file.setsampwidth(2)
        wav_file.setframerate(int(sample_rate))
        for freq, duration in zip(freqs, durations):
            for i in range(int(duration * sample_rate)):
                value = int(volume * 32767.0 * math.sin(2.0 * math.pi * freq * i / sample_rate))
                wav_file.writeframesraw(struct.pack('<h', value))

# Correct: ding ding ding (A, C#, E)
generate_tone('c:\\Flutter\\rotterdamxplore\\assets\\audio\\correct.wav', [440, 554, 659], [0.1, 0.1, 0.15])

# Wrong: low buzz
generate_tone('c:\\Flutter\\rotterdamxplore\\assets\\audio\\wrong.wav', [150], [0.3])
