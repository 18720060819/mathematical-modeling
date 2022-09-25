dy=@(t,y) [y(2);1000*(1-y(1)^2)*y(2)-y(1)]; %������������
[t,y]=ode15s(dy,[0 3000],[2;0]);  %����ֵ��
plot(t,y(:,1),'*')
title('Solution of van der Pol Equation,mu=1000');
xlabel('time t');
ylabel('solution y');
