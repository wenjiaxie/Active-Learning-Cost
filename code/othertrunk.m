function [costa,dv_total,result,svmmodel,numcurr] = othertrunk(svmmodelold,i,numcurr,threshold,op)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
i

filename = ['stream\trunk',num2str(i),'.mat'];

load(filename)

result = zeros(6,10);

 samp = unidrnd(max(size(t)),1,max(size(t))/100); % firstly choose 1% random samples to awake active learning
 
 n = max(size(t));
 
 data_tr = t(samp,1:10);
 
 label_tr = t(samp,11);
 
 svmmodel =  lsvmtrain(label_tr, data_tr,'-c 10 -w0 5 -q');
 
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
 
[pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');

[tp,tn,fp,fn] = Accu_Analysis(label_ts,pl);


costa =  fn + fp*10+ 150;
costb  = fn + fp*10+ 150;

result(:,1) = [acc(1),tp,tn,fp,fn,costa]';

i = 1;

tmp1 = 1;




while((tmp1<11) && (costa>=costb))
   
    result(:,tmp1) = [acc(1),tp,tn,fp,fn,costb]';
    
    costa = costb;

    tr_set_add = [];
    
    dv2 = abs(dv);
    
    for tmp = 1:(n/100)    

        [i,j] = find(dv2 == min(dv2));
        
        tr_add = ts_total(i,:); 
        
        tr_set_add = [tr_set_add;tr_add];
        
        ts_total(i,:) = [];
        
        dv2(i,:) = [];
    end
    
    tr_data_add = tr_set_add(:,1:10);
    
    tr_label_add = tr_set_add(:,11);
    
    data_tr = [data_tr;tr_data_add];
 
    label_tr = [label_tr;tr_label_add];
    
    data_ts = ts_total(:,1:10);
        
    label_ts = ts_total(:,11);
    
     svmmodel =  lsvmtrain(label_tr, data_tr,'-c 10 -w0 5 -q');
     
    [pl,acc,dv] = lsvmpredict(label_ts, data_ts, svmmodel,'-q');

    [tp,tn,fp,fn] = Accu_Analysis(label_ts,pl);
    
    costb = 10*fp+fn +150*tmp1;
    tmp1 = tmp1+1;
end

numcurr = numcurr+1;

if(strcmp('aver',op)==1)
    
    [result(:,10),dv_total] = Doaver(svmmodelold,svmmodel,threshold,numcurr,label_ts, data_ts,tmp1);
elseif(strcmp('qvt',op)==1)
    
    [result(:,10),dv_total] = Dobanch(svmmodelold,svmmodel,threshold,numcurr,label_ts, data_ts,tmp1);
    
else
    
    overmodel = overmodel_train(label_tr,data_tr,svmmodelold,svmmodel,numcurr,threshold);
    
    [result(:,10),dv_total] = Doover(svmmodelold,svmmodel,threshold,numcurr,label_ts, data_ts,tmp1,overmodel);

end


end

