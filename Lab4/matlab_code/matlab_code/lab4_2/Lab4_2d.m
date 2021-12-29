[aud, fs] = audioread("mysteryclip.wav");

%partC
D = 0.1;
r = -0.7;
M = D * fs;
b = 1;
a = zeros(1,M);
a(1) = 1;
a(M) = r;
outc = filter(a,b,aud);

%partD
fo = 100 * 15;
wo = fo/(fs/2);
bw = wo/35;
[a,b] = iirnotch(wo,bw);
outd = filter(a,b,outc);

[S,F,T] = stft(outd,fs);
fig = pcolor(T,F, abs(S));
title('stft of signal after notch filter')
xlabel('Time (s)')
ylabel('Frequency (Hz)')
shading flat
colorbar

saveas(fig,'Lab4_2d.jpg')