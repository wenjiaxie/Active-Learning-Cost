load('pool\trunk1.mat')

data = t(:,1:10);

label = t(:,11);

tr_data = data(1:1000,1:10);

ts_data = data(1001:10000,1:10);

lr = label(1:1000,1);

ls = label(1001:10000,1);

svmmodel =  lsvmtrain(lr, tr_data);

[pl,acc,dv] = lsvmpredict(ls, ts_data, svmmodel);

[tp,tn,fp,fn] = Accu_Analysis(ls,pl);


