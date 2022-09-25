clc,clear
x0=[4.93   2.33   3.87   4.35   6.63   7.15   5.37   6.39   7.81   8.35];
x1=cumsum(x0);  %��1���ۼ�����
n=length(x0);
z=0.5*(x1(2:n)+x1(1:n-1));   %��x1�ľ�ֵ��������
B=[-z',z'.^2];
Y=x0(2:end)';
ab_hat=B\Y     %���Ʋ���a,b��ֵ
x=dsolve('Dx+a*x=b*x^2','x(0)=x0');  %��ⳣ΢�ַ���
x=simple(x);  %�Է��Ž���л���
x=subs(x,{'a','b','x0'},{ab_hat(1),ab_hat(2),x0(1)});  %�������ֵ
yuce=subs(x,'t',[0:n-1])   %����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6) %��ʾ6λ���ֵķ��Ž�
x0_hat=[yuce(1),diff(yuce)] %����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat    %��в�
delta=abs(epsilon./x0)  %��������
xlswrite('book4.xls',[x0',x0_hat',epsilon',delta'])
