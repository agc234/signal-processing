function [A] = colconv(X, Y)
    [~, cols] = size(X);
    outarr = [];
    Y = Y.';
    X2 = X(1:end, 1);
    for i = 1:1:cols
       outr = conv(X(1:end, i), Y);
       outarr = horzcat(outarr, outr);
    end

    A = uint8(outarr);
end