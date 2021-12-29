%{
a

t1 = \sqrt{(B)^2 + (L-2A)^2}/c_s
t2 = \sqrt{(B)^2 + (L-A)^2}/c_s
%}

% b
sig = @(t) 1000*cos(880*pi*t).*heaviside(t);

% c + d
A = 0.5;
B = 100;
L = 100;
fs = 44100;
cs = (1000/3);
tau1 = sqrt((B^2)+(L-2*A)^2)/(cs);
tau2 = sqrt((B^2)+(L-A)^2)/(cs);
t = (min(tau1,tau2)-0.01):(1/fs):(max(tau1,tau2)+0.01);
[y1sig, y2sig] = lab1sim(A,B,L,sig);

subplot(2,1,1);
plot(t,y1sig(t));
title('y1sig response');
xlabel('time(s)');
ylabel('magnitude');
axis([ (min(tau1,tau2) - 0.01) (max(tau1,tau2)+0.01) -1500 1500 ]);

subplot(2,1,2);
plot(t,y2sig(t));
title('y2sig response');
xlabel('time(s)');
ylabel('magnitude');
axis([ (min(tau1,tau2) - 0.01) (max(tau1,tau2)+0.01) -1500 1500 ]);