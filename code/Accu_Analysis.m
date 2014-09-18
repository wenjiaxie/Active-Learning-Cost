function [tp,tn,fp,fn] = Accu_Analysis(lo,lp)

tp = 0; tn = 0; fp = 0; fn = 0;

sizel = max(size(lo));

for i = 1:sizel
    
    if((logical(lo(i) == 0)) && (logical(lp(i) == 1)))
        fp = fp +1;
    elseif((logical(lo(i) == 1)) && (logical(lp(i) == 0)))
        fn = fn + 1;
    elseif((logical(lo(i) == 1)) && (logical(lp(i) == 1)))
        tp = tp + 1;
    else
        tn = tn +1;
    end
    
    
end



end
