function plotGrandAverages1(fisher, lhfreqsamples, rhfreqsamples)
    newlh = cell(size(lhfreqsamples, 1), 1);
    for i = 1:size(lhfreqsamples, 1)
        result= permute(lhfreqsamples{i},[2 1 3]);
        newlh{i} = result;
    end
    A = cell2mat(newlh);
    A = mean(A, 1);
    A = reshape(A, [16 37]);
   
    newrh = cell(size(rhfreqsamples, 1), 1);
    for i = 1:size(rhfreqsamples, 1)
        result= permute(rhfreqsamples{i},[2 1 3]);
        newrh{i} = result;
    end
    B = cell2mat(newrh);
    B = mean(B, 1);
    B = reshape(B, [16 37]);
    
    featIdx = 1;
    chanIdx = 1;
    top5Chan = [];
    while length(top5Chan)<5
        chan = mod(fisher.fList(featIdx),16);
        if chan == 0
            chan = 16;
        end
        if ~ismember(chan, top5Chan)
            top5Chan(chanIdx) = chan;
            chanIdx = chanIdx +1;
        end
        featIdx = featIdx+1;
    end
    

    for i = 1:5
        xaxis = [4:40];
        figure;
        plot(xaxis, 10*log10(A(top5Chan(i),:)))
        hold on;
        plot(xaxis, 10*log10(B(top5Chan(i),:)))
        title("Left/Right Hand Grand Average Channel: " + top5Chan(i));
        xlabel('Frequency (Hz)');
        ylabel('PSD');
    end
end

        