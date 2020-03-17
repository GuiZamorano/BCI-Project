function plotGrandAverages3(fisher, A, B, topo)
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
        [pxx,f] = pwelch(A(:,:),chebwin(512),0,512,512);
        topo2(mean(pxx(top5Freq(i):top5Freq(i)+2,:)), topo);
        title("Both Feet Frequency: [" + (top5Freq(i)-1) + " - " + (top5Freq(i)+1) + "]");
        colorbar;
        saveas(gcf, "HW2/CR09NA/S2/freqa" + top5Freq(i)+ ".png");
        figure;
        [pxx,f] = pwelch(B(:,:),chebwin(512),0,512,512);
        topo2(mean(pxx(top5Freq(i):top5Freq(i)+2,:)), topo);
        title("Right Hand Frequency: [" + (top5Freq(i)-1) + " - " + (top5Freq(i)+1) + "]");
        colorbar;
        saveas(gcf, "HW2/CR09NA/S2/freqb" + top5Freq(i)+ ".png");
    end
end

        