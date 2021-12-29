%{
a

Without the input function s(t), 
it is difficult to calculate delay between when the signal
from the speaker was released, to when it was recieved.
If we assume the speaker let out sound at t=0, then t_1 and t_2 is when it
arrived.
%}

% b
A = 0.5;
B = 100;
L = 100;
fs = 44100;
sig = @(t) 1000*cos(880*pi*t).*heaviside(t);
t = 0:(1/fs):0.5;
[y1sig, y2sig] = lab1sim(A,B,L,sig);
x = y1sig(t);
y = y2sig(t);
[C, lags] = xcorr(x,y);
plot(lags/fs,C);
title('xcorr of y1sig and y2sig');
xlabel('lag indicies over f_s')
ylabel('cross-correlation');
axis([-0.1 0.1 (min(C)*1.1) (max(C)*1.1)]);

[peak, index] = max(C);
rtshift = abs(lags(index)/fs); % correct since | 0.4221 - 0.4232 | = -0.0011


