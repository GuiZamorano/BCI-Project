function [lh, rh, bf] = separateTYP(h,s,online)
    lh = [];
    rh = [];
    bf = [];
    shift = 4;
    if online == true
        shift = 5;
    end
    for j = 1:length(h)
        current_signal = s(j).s;
        for i = 1:shift:length(h(j).EVENT.TYP)-(shift-1)
            if h(j).EVENT.TYP(i+2) == 769
                signal = current_signal(h(j).EVENT.POS(i+3):h(j).EVENT.POS(i+3)+h(j).EVENT.DUR(i+3),:);
                lh = [lh;{signal}];
            elseif h(j).EVENT.TYP(i+2) == 770
                signal = current_signal(h(j).EVENT.POS(i+3):h(j).EVENT.POS(i+3)+h(j).EVENT.DUR(i+3),:);
                rh = [rh;{signal}];
            elseif h(j).EVENT.TYP(i+2) == 771
                signal = current_signal(h(j).EVENT.POS(i+3):h(j).EVENT.POS(i+3)+h(j).EVENT.DUR(i+3),:);
                bf = [bf;{signal}];
            end
        end
    end
end