clc
clear all


warning off all

[ result,svmmodel ] = FirstTrunk( );

[m,n] = size(result);

result_total = zeros(m,n,99);

result_total(:,:,1) = result;

svmmodelold = cell(10,1);

svmmodelold{1}.model = svmmodel;

threshold = 10;

numcurr = 1;

%op = qvt ; op = over; op = aver

op = 'over';

costa_arr = ones(98,12);

for i=2:99
    
if(numcurr<=threshold)
    
    svmmodelold{numcurr}.model = svmmodel;
    
    result_total(:,:,i) = result;
else
    
    for j=1:(threshold-1)
        
        svmmodelold{j}.model =  svmmodelold{j+1}.model;
        
    end
    
    svmmodelold{j}.model = svmmodel;
    

    
    result_total(:,:,i) = result;
    
end

mesage = 'reach';



[costa,dav,result,svmmodel,numcurr] = othertrunk(svmmodelold,i,numcurr,threshold,op);

costa_arr(i-1,1) = costa;

costa_arr(i-1,2) = result(6,10);

end