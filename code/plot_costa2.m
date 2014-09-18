plot(costa_arr(:,1),'r * -');
hold on;
plot(costa_arr(:,2),'b x -');

legend('Single-trunk-AC','Ensemble Learning');

xlabel('trunk-number')

ylabel('Cost')

title('effect of ensemble learning - committee')

axis([3 100 500 6000])
grid on;