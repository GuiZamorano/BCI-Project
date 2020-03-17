function [A,B] = getGrandAverageMatrices(lhsamples, rhsamples)
    A = cell2mat(lhsamples);
    A = mean(A, 1);
    A = reshape(A, [512 16]);

    B = cell2mat(rhsamples);
    B = mean(B, 1);
    B = reshape(B, [512 16]);
end