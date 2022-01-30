import numpy, scipy
import librosa
import os
import sys
import soundfile as sf


# Harmonic-Percussive Source Separation

def do_hpss(input_wave):

    xh, sr_h = librosa.load(input_wave, sr=None)
    print("length in samples: {}, sample rate: {}".format(len(xh), sr_h))

    # Compute the STFT:              
    X = librosa.stft(xh)
    
    # Perform harmonic-percussive source separation:
    H, P = librosa.decompose.hpss(X)

    # Transform the harmonic output back to the time domain:
    h = librosa.istft(H)
    
    # Transform the percussive output back to the time domain:
    p = librosa.istft(P)


    output_filename_stem = os.path.splitext(input_wave)[0]

    # write output files
    sf.write(output_filename_stem + ".percussive.wav", p, sr_h, 'PCM_16')
    sf.write(output_filename_stem + ".harmonic.wav", h, sr_h, 'PCM_16')

    
if __name__=="__main__":
    
    # check we have an input file
    if len(sys.argv) < 2:
        print("You must give an input file to decompose!!")
        sys.exit()

    input_wave = sys.argv[1]
    do_hpss(input_wave)



