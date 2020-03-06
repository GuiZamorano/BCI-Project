function [lhfreqsamples, rhfreqsamples] = getfreqSamplesfft(lhsamples, rhsamples, fs)
    lhfreqsamples = cell (size(lhsamples, 1), 1);
    for i = 1:size(lhsamples, 1)
        temp = zeros(size(lhsamples{i}, 3), size(lhsamples, 1), 37);
        for j = 1:size(lhsamples{i}, 3)
            for k = 1:size(lhsamples{1}, 1)
                pxx = abs(fft(lhsamples{i}(k,:,j)));
                lhfreq = pxx(5:41);
                temp(j, k, :) = lhfreq;
            end
        end
        lhfreqsamples{i} = temp;
    end
    rhfreqsamples = cell (size(rhsamples, 1), 1);
    
    for i = 1:size(rhsamples, 1)
        temp = zeros(size(rhsamples{i}, 3), size(rhsamples, 1), 37);
        for j = 1:size(rhsamples{i}, 3)
            for k = 1:size(rhsamples{1}, 1)
                pxx = abs(fft(rhsamples{i}(k,:,j)));
                rhfreq = pxx(5:41);
                temp(j, k, :) = rhfreq;
            end
        end
        rhfreqsamples{i} = temp;
    end
end