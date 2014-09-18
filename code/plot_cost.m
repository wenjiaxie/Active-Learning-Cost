plot(result(1,:),'k * --')
hold on
plot((result(4,:)*10 + result(5,:))/100,'b * -');
hold on
plot(result(6,:)/100,'r p -');
hold on
plot(1.5:1.5:16.5,'g x -');
grid on

axis([0 12 0 140]);

legend('Accuracy','Misclassifaction Cost','Total Cost','Labeling Cost');

title('Cost Separation')

ylabel('Accuracy % or Cost/100')

xlabel('Active Learning fold')

text(7,88,'84.08')

text(7,47,'42.50')



