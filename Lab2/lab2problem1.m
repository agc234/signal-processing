% All code is below for Part 1, simply uncomment the section you are
% grading.

%a

% I = imread('./WeeksHallSmall.jpg');
% gI = rgb2gray(I);
% imshow(I);
% pgI = double(gI);

%b

% I = imread('./WeeksHallSmall.jpg');
% gI = rgb2gray(I);
% pgI = double(gI);
% M = 16;
% b = @(M) (1/M) * ones(1,M);
% Br = rowconv(pgI, b(M));
% Bc = colconv(pgI, b(M));
% imshow(Br);
% imshow(Bc)

%c

% I = imread('./WeeksHallSmall.jpg');
% gI = rgb2gray(I);
% pgI = double(gI);
% tau = 1;
% d = [tau, -tau];
% Cr = rowconv(pgI, d);
% Cc = colconv(pgI, d);
% imshow(Cr);
% imshow(Cc);

%d

% I = imread('./WeeksHallSmall.jpg');
% gI = rgb2gray(I);
% pgI = double(gI);
% tau2 = 5;
% drow = [0 0 0; 0 tau2 -tau2; 0 0 0];
% dcol = [0 0 0; 0 tau2 0; 0 -tau2 0];
% dur = [0 0 -tau2; 0 tau2 0; 0 0 0];
% D = conv2(pgI, dcol);
% imshow(uint8(D));

%e

% tau3 = 5;
% dur = [0 0 0 0 0; 
%        0 0 0 -tau3 0; 
%        0 0 tau3 0 0; 
%        0 0 0 0 0; 
%        0 0 0 0 0];
% 
% E = conv2(pgI, dur);
% imshow(uint8(E));

%f

% tau = 4;
% I = imread('./WeeksHallSmall.jpg');
% gI = rgb2gray(I);
% pgI = double(gI);
% [LoD,HiD] = wfilters('haar','d');
% [cA,cH,cV,cD] = dwt2(gI,LoD,HiD,'mode','symh');
% subplot(2,2,1);
% imshow(uint8(cA*0.5));
% title('Approximation');
% subplot(2,2,2);
% imshow(uint8(cH*tau));
% title('Horizontal');
% subplot(2,2,3);
% imshow(uint8(cV*tau));
% title('Vertical');
% subplot(2,2,4);
% imshow(uint8(cD*tau));
% title('Diagonal');

% g

% I = imread('./WeeksHallSmall.jpg');
% gI = rgb2gray(I);
% X = double(gI);
% tau = 10;
% [LoD,HiD] = wfilters('haar','d');
% [cA,cH,cV,cD] = dwt2(X,LoD,HiD,'mode','symh');
% Xperf = idwt2(cA,cH,cV,cD,'haar', size(X));
% imshow(uint8(X));
% diff = X - Xperf;
% sqrdErr = sum(sum((diff).^2));
% avgSqrdErr = sqrdErr/numel(X);
% maxDiff = max(max(abs(X - Xperf)));
% imshow(uint8(diff));

% h

% I = imread('./WeeksHallSmall.jpg');
% gI = rgb2gray(I);
% X = double(gI);
% tau = 10;
% [LoD,HiD] = wfilters('haar','d');
% [cA,cH,cV,cD] = dwt2(X,LoD,HiD,'mode','symh');
% [r, c] = size(cA);
% N = zeros(r,c);
% Xperf = idwt2(cA,N,N,N,'haar', size(X));
% imshow(uint8(X));
% diff = X - Xperf;
% sqrdErr = sum(sum((diff).^2));
% avgSqrdErr = sqrdErr/numel(X);
% maxDiff = max(max(abs(X - Xperf)));
% imshow(uint8(diff));

% Zeroing out rows for part h

% Y = X;
% [rX, cX] = size(X);
% D = zeros(1, cX);
% for i = 1:5
%     Y(i, 1:end) = zeros(1, cX);
% end
% imshow(uint8(Y));
% 
% diff2 = X - Y;
% avgSqrdErr2 = sum(sum((diff2).^2))/numel(X);