function plotTopFeatures(fisher)
    labelsForPlotting = strings(1, length(fisher.fList));
    k = 1;
    for i = 1:43
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
    saveas(gcf, 'HW2/CR09NA/S2/fig1.png');
    
       

end
     