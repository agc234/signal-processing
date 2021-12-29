[aud, fs] = audioread("mysteryclip.wav");

[S,F,T] = stft(aud,fs);
fig = pcolor(T,F, abs(S));
title('stft of signal after notch filter')
xlabel('Time (s)')
ylabel('Frequency (Hz)')
shading flat
colorbar

saveas(fig,'Lab4_2b.jpg')