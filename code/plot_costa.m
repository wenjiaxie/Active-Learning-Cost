
clc
% costa_arr2 = costa_arr;
% 
% for i=2:99
%     costa_arr2(i,2) = result_total(1,10,i);
%     
%     n = find(result_total(6,:,i+1) == costa_arr(i-1,1));
%     
%     if(isempty(n))
%         n=9;
%     end
%     
%     if(max(size(n))>1)
%         n = n(max(size(n)));
%     end
%     
%     costa_arr2(i-1,1) = result_total(1,n,i+1);
%     
% end

plot(costa_arr2(1:97,1),'r * -');
hold on;
plot(costa_arr2(3:99,2),'b x -');

legend('Single-trunk-AC','Ensemble Learning');

xlabel('trunk-number')

ylabel('Accuracy')

title('effect of ensemble learning - committee')

axis([3 100 50 100])
grid on;