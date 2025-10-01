# DPLM only handles 6ch, 5.1 => L, R, C, LFE, Ls, Rs
ffmpeg -hide_banner -i input.wav -filter_complex "[0:a]channelmap=map=FL-FL|FR-FR|FC-FC|LFE-LFE|BL-BL|BR-BR:channel_layout=5.1[surround]; [0:a]channelmap=map=SL-FL|SR-FR:channel_layout=stereo[stereo]" -map "[surround]" -c:a pcm_s24le output_surround.wav -map "[stereo]" -c:a pcm_s24le output_stereo.wav


# If Protools come in as {L, C, R, Ls, Rs, LFE} to go to {L, R, C, LFE, Ls, Rs}, re-order channels with:  0, 2, 1, 5, 3, 4 
ffmpeg -hide_banner -i input.wav -filter_complex "[0:a]channelmap=map=FL-FL|FC-FR|FR-FC|BR-LFE|LFE-BL|BL-BR:channel_layout=5.1[surround]; [0:a]channelmap=map=SL-FL|SR-FR:channel_layout=stereo[stereo]" -map "[surround]" -c:a pcm_s24le output_surround.wav -map "[stereo]" -c:a pcm_s24le output_stereo.wav
