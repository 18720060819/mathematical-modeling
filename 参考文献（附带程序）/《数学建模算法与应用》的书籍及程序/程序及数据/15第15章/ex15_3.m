clc,clear
x0=[41,49,61,78,96,104]; %ԭʼ����
n=length(x0); 
x1=cumsum(x0)  %����1���ۼ�����
a_x0=diff(x0)' %����1���ۼ�����
z=0.5*(x1(2:end)+x1(1:end-1))'; %�����������
B=[-x0(2:end)',-z,ones(n-1,1)]; 
u=B\a_x0   %��С���˷���ϲ���
x=dsolve('D2x+a1*Dx+a2*x=b','x(0)=c1,x(5)=c2');  %���ֵ����ķ��Ž�
x=subs(x,{'a1','a2','b','c1','c2'},{u(1),u(2),u(3),x1(1),x1(6)});
yuce=subs(x,'t',0:n-1); %����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6) %��ʾ6λ���ֵķ��Ž�
x0_hat=[yuce(1),diff(yuce)]; %����֪���ݵ��Ԥ��ֵ
x0_hat=round(x0_hat) %��������ȡ����
epsilon=x0-x0_hat    %��в�
delta=abs(epsilon./x0)  %��������
