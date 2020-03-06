function [X, Y] = getXYMatrix(lhfreqsamples, rhfreqsamples)
    newlh = cell(size(lhfreqsamples, 1), 1);
    for i = 1:size(lhfreqsamples, 1)
        result= permute(lhfreqsamples{i},[2 1 3]);
        [Win, Chan, Freq] = size(result);
        result=reshape(result,[Win Freq*Chan]);
        newlh{i} = result;
    end
    A = cell2mat(newlh);

    newrh = cell(size(rhfreqsamples, 1), 1);
    for i = 1:size(rhfreqsamples, 1)
        result= permute(rhfreqsamples{i},[2 1 3]);
        [Win, Chan, Freq] = size(result);
        result=reshape(result,[Win Freq*Chan]);
        newrh{i} = result;
    end
    A1 = cell2mat(newrh);
    X = [A;A1];
    Y = zeros(size(A, 1)+size(A1, 1), 1);
    Y(1:size(A,1))=1;
    Y(size(A,1)+1:end)=2;