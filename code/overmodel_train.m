function [overmodel] = overmodel_train(label_tr, data_tr,svmmodelold,svmmodel,numcurr,threshold)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if(numcurr<=threshold)
    
    n= max(size(label_tr));
    
    dv_total = zeros(n,numcurr);
    
    %pl = zeros(n,1);
    
    [pl,acc,dv] = lsvmpredict(label_tr, data_tr, svmmodel,'-q');
    
    dv_total(:,numcurr) = dv;

    for i=1:(numcurr-1)
        
     svmmodel =  svmmodelold{i}.model;
     
    [pl,acc,dv] = lsvmpredict(label_tr, data_tr, svmmodel,'-q');

    dv_total(:,i) = dv;
    
  
    
    end
    
    overmodel =  lsvmtrain(label_tr, dv_total,'-c 5 -w0 20 -q');
    

else
    
     n= max(size(label_tr));
    
    dv_total = zeros(n,10);
    
    pl = zeros(n,1);
    
    [pl,acc,dv] = lsvmpredict(label_tr, data_tr, svmmodel,'-q');
    
    dv_total(:,1) = dv;

    for i=2:10
        
     svmmodel =  svmmodelold{i}.model;
     
    [pl,acc,dv] = lsvmpredict(label_tr, data_tr, svmmodel,'-q');

    dv_total(:,i) = dv;
    
    end
    
  overmodel =  lsvmtrain(label_tr, dv_total,'-c 5 -w0 20 -q');
    
end
end

