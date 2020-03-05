function [lh, rh, bf] = separateTYP(h,s)
    lh = [];
    rh = [];
    bf = [];
    for j = 1:length(h)
        current_signal = s(j).s;
        for i = 1:4:length(h(j).EVENT.TYP)-3
            if h(j).EVENT.TYP(i+2) == 769
                signal = current_signal(h(j).EVENT.POS(i+2):h(j).EVENT.POS(i+3)+h(j).EVENT.DUR(i+3),:);
                lh = [lh;{signal}];
            elseif h(j).EVENT.TYP(i+2) == 770
                signal = current_signal(h(j).EVENT.POS(i+2):h(j).EVENT.POS(i+3)+h(j).EVENT.DUR(i+3),:);
                rh = [rh;{signal}];
            elseif h(j).EVENT.TYP(i+2) == 771
                signal = current_signal(h(j).EVENT.POS(i+2):h(j).EVENT.POS(i+3)+h(j).EVENT.DUR(i+3),:);
                bf = [bf;{signal}];
            end
        end
    end
end