
plot((result(4,:)*10 + result(5,:))/100,'b * -');
hold on
plot(result(4,:)*0.1,'r p -');
hold on
plot(result(5,:)*0.01,'g x -');
hold on

axis([0 12 0 140]);

legend('Total Misclassifaction Cost','Fp Cost','Fn Cost');

title('Misclassifaction Cost Separation')

ylabel('Cost/100')

xlabel('Active Learning fold')




