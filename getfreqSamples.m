function [lhfreqsamples, rhfreqsamples] = getfreqSamples(lhsamples, rhsamples, fs)
    lhfreqsamples = cell (60, 1);
    for i = 1:size(lhsamples, 1)
        temp = zeros(size(lhsamples{i}, 3), size(lhsamples, 1), 43);
        for j = 1:size(lhsamples{i}, 3)
            for k = 1:size(lhsamples{1}, 1)
                [pxx,~] = pwelch(lhsamples{i}(k,:,j),512,0,512,fs);
                lhfreq = pxx(5:47);
                temp(j, k, :) = lhfreq;
            end
        end
        lhfreqsamples{i} = temp;
    end
    rhfreqsamples = cell (60, 1);
    
    for i = 1:size(rhsamples, 1)
        temp = zeros(size(rhsamples{i}, 3), size(rhsamples, 1), 43);
        for j = 1:size(rhsamples{i}, 3)
            for k = 1:size(rhsamples{1}, 1)
                [pxx,~] = pwelch(rhsamples{i}(k,:,j),512,0,512,fs);
                rhfreq = pxx(5:47);
                temp(j, k, :) = rhfreq;
            end
        end
        rhfreqsamples{i} = temp;
    end
end