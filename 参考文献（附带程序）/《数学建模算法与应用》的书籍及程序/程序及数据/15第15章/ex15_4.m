clc,clear
x0=[2.874,3.278,3.39,3.679,3.77,3.8]; %ԭʼ��������
n=length(x0);
a_x0=diff(x0)';  %��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)]; 
u=B\a_x0  %��С���˷���ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');  %�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)}); 
yuce=subs(x,'t',0:n-1); %����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)] %����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat %��в�
delta=abs(epsilon./x0)  %��������
