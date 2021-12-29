function [theta, L] = lab1est(A, B, y1, y2)
fs=44100;
cs=1000/3;
[C, lags] = xcorr(y1,y2);
[~, index] = max(C);
rtshift = abs(lags(index)/fs);
theta = asin((cs/A)*rtshift);
L = real(B*tan(theta));
end