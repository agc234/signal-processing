% d
c1 = 1;
c2 = 0.5;
a = [0, c1, 1]; % corresponds to (0 + c1z^-1 + 1z^-2)
b = [1,-1*c2]; % corresponds to (1 - c2z^-1)

zplane(a,b);
title('Pole-zero diagram of H(z)', 'FontSize', 14);

% e
w = linspace(-pi, pi);
h = ((c1 + exp(1i.*w)).*exp(1i.*w))./(1 - c2.*exp(1i.*w));
%h = freqz(a, b, w);

x = linspace(0, pi);
y = 20*log10(abs(h));
plot(w, y);
xlim([-1.3*pi 1.3*pi]);
%ylim([-300 200])
ylabel('Magnitude (dB)');
xlabel('Frequency (rad/s)')