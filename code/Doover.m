function [result,dv_total] = Doover(svmmodelold,svmmodel,threshold,numcurr,label_ts, data_ts,tmp1,overmodel)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if(numcurr<=threshold)
    
    n= max(size(label_ts));
    
    dv_total = zeros(n,numcurr);
    
    pl = zeros(n,1);
    
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');
    
    dv_total(:,numcurr) = dv;

    for i=1:(numcurr-1)
        
     svmmodel =  svmmodelold{i}.model;
     
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');

    dv_total(:,i) = dv;
    
    end
    
      [pl,acc,dv] = lsvmpredict(label_ts, dv_total, overmodel,'-q');
    
    [tp,tn,fp,fn] = Accu_Analysis(label_ts,pl);
    
    costb = 10*fp+fn +150*tmp1;
    
    %acc = ((tp+tn)/(tp+tn+fp+fn));
    
    result = [acc(1);tp;tn;fp;fn;costb];

    
else
    
     n= max(size(label_ts));
    
    dv_total = zeros(n,10);
    
    pl = zeros(n,1);
    
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');
    
    dv_total(:,1) = dv;

    for i=2:10
        
     svmmodel =  svmmodelold{i}.model;
     
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');

    dv_total(:,i) = dv;
    
    end
    
     [pl,acc,dv] = lsvmpredict(label_ts, dv_total, overmodel,'-q');
    
    [tp,tn,fp,fn] = Accu_Analysis(label_ts,pl);
    
    costb = 10*fp+fn +150*tmp1;
    
    %acc = ((tp+tn)/(tp+tn+fp+fn));
    
    result = [acc(1);tp;tn;fp;fn;costb];
    
end

end

