% a

cs = 1000/3;
A = 0.5;
B = 100;
L = 100;
fs = 44100;
sig = @(t) 1000*cos(880*pi*t).*heaviside(t);
t = 0:(1/fs):0.5;
[y1, y2] = lab1sim(A,B,L,sig);
alpha = 100;

w1 = @(t) randn(size(t));
w2 = @(t) randn(size(t));

z1 = @(t) y1(t) + alpha*w1(t);
z2 = @(t) y2(t) + alpha*w2(t);

%{
subplot(2,1,1);
plot(t,z1(t));
title('z1');
axis([ 0.42 0.44 (-1500) 1500]);

subplot(2,1,2);
plot(t,z2(t));
title('z2');
axis([ 0.42 0.44 (-1500) 1500]);
%}

% b

asize = 10;
N = 100;
alphas = linspace(10, 150, asize);
errors = zeros(1, asize);

for i = 1:1:asize
    alpha = alphas(i);
    err = 0;
    for j = 1:1:N
        nz1 = @(t) y1(t) + alpha*w1(t);
        nz2 = @(t) y2(t) + alpha*w2(t);
        [~, neLz] = lab1est(A,B,nz1(t),nz2(t));
        err = err + (neLz - L)^2;
    end
    error = err/N;
    errors(i) = error;
end

plot(alphas,errors);
title('MAE for alphas between 10 and 150');
ylabel('Mean Average Error');
xlabel('alpha');
axis([(min(alphas)) (max(alphas)) (0) (max(errors))]);












