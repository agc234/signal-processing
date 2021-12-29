% NOTE FOR GRADER: All parts are commented out, and some require other
% parts uncommented. Grade each part individually, uncommenting what is necessary.

% a

f0 = 44000;
fc = 440;
fN = 1760;
N = 2^20;

t = 0:(1/f0):2;
x = @(t) cos(2*pi*fc*t) + cos(2*pi*(1.5*fc)*t) + cos(2*pi*(2*fc)*t);
x1 = x(t);

% Don't uncomment this portion if used in later sections
% plot(t,x1(1:length(t)));
% hold on

% soundsc(x(t),f0);

%b (uncomment part a to use properly)

% f = linspace((-f0/2),(f0/2),N);
% xdt = fft(x(t), N);
% plot(f, abs(fftshift(xdt)));
% xlabel('f [Hz]')
% ylabel('Magnitude of X(f).');
% title('CTFT Approximation of x(t)');

% c (uncomment part a to use properly)

% samples according to a factor applied to the Nyquist rate

% nfac = @(x) floor(x*(f0/fN));
% x2 = upsample(downsample(x(t),nfac(2)),nfac(2));
% t2 = 0:1/f0:0.05;

% Don't uncomment this portion if used in later sections

% plot(t2,x1(1:length(t2)));
% hold on;
% s = stem(t2,x2(1:length(t2)));
% set(s,'MarkerFaceColor','blue','Marker','none');
% xlabel('t [seconds]');
% ylabel('Amplitude of Signal');
% title('880 Hz Downsample of x(t) (from 0 to 0.05 s)');

% soundsc(x2,f0);

% d (uncomment part a and c to use properly)

% f2 = linspace((-pi),pi,N);
% x2dt = fft(x2, N);
% plot(f2, abs(fftshift(x2dt)));
% xlabel('f [Hz]')
% ylabel('Magnitude of X(f).');
% title('FFT of Downsampled x(t)');

% e (uncomment part a to use properly)

% samples according to a factor applied to the Nyquist rate

% nfac = @(x) floor(x*(f0/fN));
% x3 = upsample(downsample(x(t),nfac(0.1)),nfac(0.1));
% t3 = 0:1/f0:0.005;

% Use this to verify that the signal has been upsampled.

% plot(t3,x1(1:length(t3)));
% hold on;
% s = stem(t3,x3(1:length(t3)));
% set(s,'MarkerFaceColor','blue','Marker','none');
% xlabel('t [seconds]');
% ylabel('Amplitude of Signal');
% title('17600 Hz Upsample of x(t) (from 0 to 0.005 s)');

% Don't uncomment this portion if used in later sections

% f3 = linspace((-pi),pi,N);
% x3dt = fft(x3, N);
% plot(f3, abs(fftshift(x3dt)));
% xlabel('f [Hz]')
% ylabel('Magnitude of X(f).');
% title('FFT of Upsampled x(t)');

% soundsc(x3,f0);

% f (uncomment part a and e to use properly)

% x4 = lowpass(x3, 2*fN, 10*fN);
% s1 = stem(t3, x3(1:length(t3)));
% set(s1(1),'MarkerFaceColor','blue','Marker','none');
% hold on;
% s2 = stem(t3, x4(1:length(t3)));
% set(s2(1),'MarkerFaceColor','red','Marker','none');
% xlabel('t [seconds]');
% ylabel('Amplitude of Signal');
% title('Lowpass Filtered of Upsampled x(t) (from 0 to 0.005 s)');
% soundsc(x4,f0);

% g (uncomment part a)

nfac = @(x) floor(x*(f0/fN));
x5 = upsample(downsample(x(t),nfac(0.2)),nfac(0.2));
t5 = 0:1/f0:0.005;
x6 = lowpass(x5, 2*fN, 5*fN);

% DTFT of Upsample

% f5 = linspace((-pi),pi,N);
% x5dt = fft(x5, N);
% plot(f5, abs(fftshift(x5dt)));
% xlabel('f [Hz]')
% ylabel('Magnitude of X(f).');
% title('FFT of Upsampled x(t)');

% Filter vs Upsample

s3 = stem(t5, x5(1:length(t5)));
set(s3(1),'MarkerFaceColor','blue','Marker','none');
hold on;
s4 = stem(t5, x6(1:length(t5)));
set(s4(1),'MarkerFaceColor','red','Marker','none');
xlabel('t [seconds]');
ylabel('Amplitude of Signal');
title('Lowpass Filtered of Upsampled x(t) (from 0 to 0.005 s)');
soundsc(x6,f0);
