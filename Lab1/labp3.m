% a
A = 0.5;
B = 100;
fs = 44100;
sig = @(t) 1000*cos(880*pi*t).*heaviside(t);
t = 0:(1/fs):0.5;

trueLs = linspace(1,100);
estLs = zeros(1,100);

for L = linspace(1,100)
    [y1, y2] = lab1sim(A,B,L,sig);
    [~ , eL]= lab1est(A,B,y1(t),y2(t));
    estLs(L) = eL; 
end

plot(trueLs, estLs);