function plotTopFeatures(fisher)
    labelsForPlotting = strings(length(fisher.fList));
    k = 1;
    for i = 1:37
        for j = 1:16
            numString = num2str(j);
            channelString = strcat("Channel: ", numString);
            numString2 = num2str(i+3);
            finalString = strcat(channelString, ",", "Frequency: ", numString2);
            labelsForPlotting(k) = finalString;
            k = k+1;
        end
    end
    top10Y = fisher.fList(1:10);
    top10X = categorical(labelsForPlotting(top10Y));
    top10X = reordercats(top10X,labelsForPlotting(top10Y));
    figure;
    bar(top10X, fisher.W(top10Y));
    title("Top Features");
    xlabel("Features");
    ylabel("Fisher Score");
    
    %{
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
    
%}
       

end
     