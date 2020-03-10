function plotGrandAverages2(fisher, lhfreqsamples, rhfreqsamples)
    newlh = cell(size(lhfreqsamples, 1), 1);
    for i = 1:size(lhfreqsamples, 1)
        result= permute(lhfreqsamples{i},[2 1 3]);
        newlh{i} = result;
    end
    A = cell2mat(newlh);
    A = mean(A, 1);
    A = reshape(A, [16 43]);
   
    newrh = cell(size(rhfreqsamples, 1), 1);
    for i = 1:size(rhfreqsamples, 1)
        result= permute(rhfreqsamples{i},[2 1 3]);
        newrh{i} = result;
    end
    B = cell2mat(newrh);
    B = mean(B, 1);
    B = reshape(B, [16 43]);
    
    featIdx = 1;
    freqIdx = 1;
    top5Freq = [];
    while length(top5Freq)<5
        freq = floor(fisher.fList(featIdx)/16)+4;
        if ~ismember(freq, top5Freq)
            top5Freq(freqIdx) = freq;
            freqIdx = freqIdx +1;
        end
        featIdx = featIdx+1;
    end
    

    for i = 1:5
        figure;
        topoplot((A(:,top5Freq(i)-3)), 'chanlocs16.loc');
        figure;
        topoplot((B(:,top5Freq(i)-3)), 'chanlocs16.loc');
        %xaxis = [4:40];
        %figure;
        %plot(xaxis, 10*log10(A(top5Freq(i),:)))
        %hold on;
        %plot(xaxis, 10*log10(B(top5Freq(i),:)))
        %title("Left/Right Hand Grand Average Channel: " + top5Chan(i));
        %xlabel('Frequency (Hz)');
        %ylabel('PSD');
    end
end

        