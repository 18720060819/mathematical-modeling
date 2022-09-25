clc, clear
eq=@(x,y,mu)[y(2);-mu*y(1)]; %����һ�׷��������������
bd=@(ya,yb,mu)[ya(1);ya(2)-1;yb(1)+yb(2)];  %�����ֵ��������������
guess=@(x)[sin(2*x);2*cos(2*x)]; %�����ʼ�²�����������
guess_structure=bvpinit(linspace(0,1,10),guess,5); %������ʼ�²��Ľṹ,mu=5
sol=bvp4c(eq,bd,guess_structure); %������ֵ��
plot(sol.x,sol.y(1,:),'-',sol.x,sol.yp(1,:),'--','LineWidth',2)
xlabel('x','FontSize',12)
legend('y_1','y_2')
