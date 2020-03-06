function plotGrandAverages(fisher, lhsamples, rhsamples)
    A = cell2mat(lhsamples);
    A = mean(A, 1);
    A = reshape(A, [512 16]);
   
    B = cell2mat(rhsamples);
    B = mean(B, 1);
    B = reshape(B, [512 16]);
    
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
        [pxx,f] = pwelch(A(:,top5Chan(i)),chebwin(512),0,512,512);
        figure;
        plot(f(5:41),10*log10(pxx(5:41)));
        title("Left/Right Hand Grand Average Channel: " + top5Chan(i));
        xlabel('Frequency (Hz)');
        ylabel('PSD');
        [pxx,f] = pwelch(B(:,top5Chan(i)), chebwin(512), 0, 512, 512);
        hold on;
        plot(f(5:41),10*log10(pxx(5:41)));
    end
end

        