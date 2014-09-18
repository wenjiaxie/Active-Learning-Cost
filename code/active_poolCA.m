clc
clear all

load('pool\trunk1.mat')

result = zeros(6,10);

 samp = unidrnd(max(size(t)),1,max(size(t))/100); % firstly choose 1% random samples to awake active learning
 
 n = max(size(t));
 
 data_tr = t(samp,1:10);
 
 label_tr = t(samp,11);
 
 svmmodel =  lsvmtrain(label_tr, data_tr);
 
 ts_total = [];
 
 index = [];
 
for i=1:n
    
    flag_in = sum(samp==i);  
    
    if(flag_in == 0)
        
        ts_total = [ts_total;t(i,:)];
    else     
        index = [index;i];
    end
  
end

 data_ts = ts_total(:,1:10);
 
 label_ts = ts_total(:,11);
 
[pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel);

[tp,tn,fp,fn] = Accu_Analysis(label_ts,pl);


costa =  fn*10 + fp+ 150
costb  = 0;

result(:,1) = [acc(1),tp,tn,fp,fn,costa]';

i = 1;

tmp1 = 2;




while((tmp1<12))

    tr_set_add = [];
    
    dv2 = abs(dv);
    
    for tmp = 1:(n/100)    

        [i,j] = find(dv2 == min(dv2));
        
        tr_add = ts_total(i,:); 
        
        tr_set_add = [tr_set_add;tr_add];
        
        ts_total(i,:) = [];
    end
    
    tr_data_add = tr_set_add(:,1:10);
    
    tr_label_add = tr_set_add(:,11);
    
    data_tr = [data_tr;tr_data_add];
 
    label_tr = [label_tr;tr_label_add];
    
    data_ts = ts_total(:,1:10);
        
    label_ts = ts_total(:,11);
    
     svmmodel =  lsvmtrain(label_tr, data_tr,'-c 10 -w0 5');
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel);

    [tp,tn,fp,fn] = Accu_Analysis(label_ts,pl);
    
    costb = 10*fp+fn +150*tmp1;
    
    result(:,tmp1) = [acc(1),tp,tn,fp,fn,costb]';
    
    
    
    tmp1 = tmp1+1;
end