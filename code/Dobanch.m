function [result,dv_total] = Dobanch(svmmodelold,svmmodel,threshold,numcurr,label_ts, data_ts,tmp1)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if(numcurr<=threshold)
    
    n= max(size(label_ts));
    
    dv_total = zeros(n,1);
    
    pl = zeros(n,1);
    
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');
    
    dv_total = dv_total+pl;

    for i=1:numcurr-1
        
     svmmodel =  svmmodelold{i}.model;
     
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');

    dv_total = dv_total+pl;
    
    end
    
    for j=1:n
        if(dv_total(j)<round(numcurr*0.8))
            pl(j,1) = 0;
        else
            pl(j,1) = 1;
        end
    end
    
    [tp,tn,fp,fn] = Accu_Analysis(label_ts,pl);
    
    costb = 10*fp+fn +150*tmp1;
    
    result = [tp;tn;fp;fn;costb];
    
    acc = ((tp+tn)/(tp+tn+fp+fn))*100;
    
    result = [acc;tp;tn;fp;fn;costb];
    
else
    
     n= max(size(label_ts));
    
    dv_total = zeros(n,1);
    
    pl = zeros(n,1);
    
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');
    
    dv_total = dv_total+pl;

    for i=2:10
        
     svmmodel =  svmmodelold{i}.model;
     
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');

    dv_total = dv_total+pl;
    
    end
    
    for j=1:n
        if(dv_total(j)<8)
            pl(j,1) = 0;
        else
            pl(j,1) = 1;
        end
    end
    
    [tp,tn,fp,fn] = Accu_Analysis(label_ts,pl);
    
    costb = 10*fp+fn +150*tmp1;
    
    acc = ((tp+tn)/(tp+tn+fp+fn))*100;
    
    result = [acc;tp;tn;fp;fn;costb];
    
end


end

