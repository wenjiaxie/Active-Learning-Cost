plot(dv,'r *')
x = 1:500;

hold on
plot(1:9000,[zeros(1,9000);0.01*ones(1,9000);-0.01*ones(1,9000)],'g')
hold on
plot(2950+100*sin(x),6.2+0.5*cos(x),'b ');
hold on
plot(5990+100*sin(x),-7+0.5*cos(x),'k ');
title('Sample Selection')

xlabel('Sample ID')

ylabel('Distance to Classifier')