function [lhsamples, rhsamples] = getsamples(lh, rh, fs, Num)

    lhfil = cell(size(lh,1), 1);
    for i = 1:size(lhfil, 1)
        lhfil{i} = filter(Num, 1, lh{i}(:,1:16));
    end

    [W, label] = spatialfilter(lhfil{1}, "CAR");
    lhfilsp = cell(size(lhfil, 1), 1);
    W = W(:, 1:16);
    for i = 1:size(lhfilsp, 1)
        lhfilsp{i} = W*lhfil{i}';
    end

    rhfil = cell(size(rh, 1), 1);
    for i = 1:size(rhfil, 1)
        rhfil{i} = filter(Num, 1, rh{i}(:,1:16));
    end
    rhfilsp = cell(size(rhfil, 1), 1);
    for i = 1:size(rhfilsp, 1)
        rhfilsp{i} = W*rhfil{i}';
    end

    for i = 1:size(lhfilsp, 1)
    lhfilsp{i} = lhfilsp{i}';
    end
    for i = 1:size(rhfilsp, 1)
    rhfilsp{i} = rhfilsp{i}';
    end

    temp = [];
    lhsamples = cell(size(lhfilsp, 1), 1);
    rhsamples = cell(size(rhfilsp, 1), 1);

    for i = 1:size(lhsamples, 1)
        for j = 1:16
            for l = 0:32:length(lhfilsp{i})-512
                temp((l/32)+1, :,j) = lhfilsp{i}(l+1 : 512 + l, j);
            end
        end
        lhsamples{i} = temp;
    end
    for i = 1:size(rhsamples, 1)
        for j = 1:16
            for l = 0:32:length(rhfilsp{i})-512
                temp((l/32)+1, :,j) = rhfilsp{i}(l+1 : 512 + l, j);
            end
        end
        rhsamples{i} = temp;
    end
end