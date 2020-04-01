function plotGrandAverages(fisher, A, B)
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
        %psdest = psd(spectrum.periodogram,A(:,top5Chan(i)),'Fs',512,'NFFT',512);
  
        figure;
        %plot(psdest.Frequencies(5:41), 10*log10(psdest.Data(5:41)), 'r')
        plot(f(5:47),10*log10(pxx(5:47)));
        title("Left Hand/Both Feet Grand Average Channel: " + top5Chan(i));
        xlabel('Frequency (Hz)');
        ylabel('PSD');
        [pxx,f] = pwelch(B(:,top5Chan(i)), chebwin(512), 0, 512, 512);
        %psdest = psd(spectrum.periodogram,B(:,top5Chan(i)),'Fs',512,'NFFT',512);
        hold on;
        %plot(psdest.Frequencies(5:41), 10*log10(psdest.Data(5:41)), 'b')
        plot(f(5:47),10*log10(pxx(5:47)));
        legend("Left Hand", "Both Feet");
        grid on;
        saveas(gcf, "HW2/MA29ON/S3/chan" + top5Chan(i)+ ".png");
    end
end

        