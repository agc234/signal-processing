function [A] = threshold(I, tau)
    [rows, cols] = size(I);
    X = zeros(rows,cols);
    for i = 1:rows
        for j = 1:cols
            if (I(i,j) > tau)
                X(i,j) = I(i,j);
            else
                X(i,j) = tau;
            end
        end
    end
    A = uint8(X);
end