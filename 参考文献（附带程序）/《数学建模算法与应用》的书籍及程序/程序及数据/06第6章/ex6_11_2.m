clc, clear
yprime=@(x,y)[y(2);(y(1)-1)*(1+y(2)^2)^(3/2)]; %����һ�׷��������������
res=@(ya,yb)[ya(1);yb(1)]; %�����ֵ��������������
yinit=@(x)[x.^2;2*x]; %�����ʼ�²����������������ﻻ������һ����ʼ�²��
solinit=bvpinit(linspace(-1,1,20),yinit); %������ʼ�²��Ľṹ
sol=bvp4c(yprime,res,solinit); %������ֵ��
fill(sol.x,sol.y(1,:),[0.7,0.7,0.7]) %��������
axis([-1,1,0,1])
xlabel('x','FontSize',12)
ylabel('h','Rotation',0,'FontSize',12)
