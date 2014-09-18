clc
clear all

load('stream\trunk1.mat')

result = zeros(6,10);

 samp = unidrnd(max(size(t)),1,max(size(t))/100); % firstly choose 1% random samples to awake active learning
 
 n = max(size(t));
 
 data_tr = t(samp,1:10);
 
 label_tr = t(samp,11);
 
 svmmodel =  lsvmtrain(label_tr, data_tr);
 
 ts_total = [];
 
 index = [];
 
 index2 = [];
 
for i=1:n

    
    if(sum(samp==i) == 0)
        
        ts_total = [ts_total;t(i,:)];
        
        index2 = [index2;i];
        
    else     
        index = [index;i];
    end
  
end

size(t)

size(ts_total)

 data_ts = ts_total(:,1:10);
 
 label_ts = ts_total(:,11);
 
[pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel);

[tp,tn,fp,fn] = Accu_Analysis(label_ts,pl);