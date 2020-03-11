function plotGrandAverages3(fisher, lhsamples, rhsamples, topo)
    A = cell2mat(lhsamples);
    A = mean(A, 1);
    A = reshape(A, [512 16]);
   
    B = cell2mat(rhsamples);
    B = mean(B, 1);
    B = reshape(B, [512 16]);
    
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
    

    for i = 1:1
        figure;
        [pxx,f] = pwelch(A(:,:),chebwin(512),0,512,512);
        topo2(pxx(top5Freq(i)+1,:), topo);
        title("Left Hand Frequency: " + top5Freq(i));
        figure;
        [pxx,f] = pwelch(B(:,:),chebwin(512),0,512,512);
        topo2(pxx(top5Freq(i)+1,:), topo);
        title("Right Hand Frequency: " + top5Freq(i));
    end
end

        