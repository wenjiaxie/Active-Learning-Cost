function [result,dv_total] = Doaver(svmmodelold,svmmodel,threshold,numcurr,label_ts, data_ts,tmp1)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if(numcurr<=threshold)
    
    n= max(size(label_ts));
    
    dv_total = zeros(n,1);
    
    pl = zeros(n,1);
    
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');
    
    dv_total = dv_total+dv;

    for i=1:numcurr-1
        
     svmmodel =  svmmodelold{i}.model;
     
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');

    dv_total = dv_total+dv;
    
    end
    
    for j=1:n
        if(dv_total(j)<0)
            pl(j,1) = 0;
        else
            pl(j,1) = 1;
        end
    end
    
    [tp,tn,fp,fn] = Accu_Analysis(label_ts,pl);
    
    costb = 10*fp+fn +150*tmp1;
    
    result = [tp;tn;fp;fn;costb];
    
    acc = ((tp+tn)/(tp+tn+fp+fn));
    
    result = [acc;tp;tn;fp;fn;costb];
    
else
    
     n= max(size(label_ts));
    
    dv_total = zeros(n,1);
    
    pl = zeros(n,1);
    
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');
    
    dv_total = dv_total+dv;

    for i=2:10
        
     svmmodel =  svmmodelold{i}.model;
     
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');

    dv_total = dv_total+dv;
    
    end
    
    for j=1:n
        if(dv_total(j)<0)
            pl(j,1) = 0;
        else
            pl(j,1) = 1;
        end
    end
    
    [tp,tn,fp,fn] = Accu_Analysis(label_ts,pl);
    
    costb = 10*fp+fn +150*tmp1;
    
    acc = ((tp+tn)/(tp+tn+fp+fn));
    
    result = [acc;tp;tn;fp;fn;costb];
    
end


end

