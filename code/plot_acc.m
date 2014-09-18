plot([54.56,result(1,:)],'b * -');
hold on
plot(89.55*ones(1,11),'r p -');
hold on
plot(76.91*ones(1,11),'g x -')

axis([0 12 50 100]);
grid on
legend('Active Learning','5-fold-crossvalindation','Randomly 10% Labelled Samples');

title('Accuracy Comparison')

ylabel('Accuracy%')

xlabel('Active Learning fold')

text(10,94,'89.55')

text(10,85,'89.69')

text(10,73,'76.91')


