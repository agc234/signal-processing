function [A] = rowconv(X, Y)
    [rows, ~] = size(X);
    outarr = [];
    for i = 1:1:rows
       outr = conv(X(i, 1:end), Y);
       outarr = vertcat(outarr, outr);
    end

    A = uint8(outarr);
end