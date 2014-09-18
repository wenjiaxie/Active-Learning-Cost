clc
clear all

load('stream\trunk1.mat')

data = t(:,1:10);

label = t(:,11);

tr_data = data(1:round(0.8*max(size(t))),1:10);

ts_data = data(round(0.8*max(size(t)))+1:max(size(t)),1:10);

lr = label(1:round(0.8*max(size(t))),1);

ls = label(round(0.8*max(size(t)))+1:max(size(t)),1);

svmmodel =  lsvmtrain(lr, tr_data,'-c 10 w0 5');

[pl,acc,dv] = lsvmpredict(ls, ts_data, svmmodel);

[tp,tn,fp,fn] = Accu_Analysis(ls,pl);

cost = 10*fp + fn;