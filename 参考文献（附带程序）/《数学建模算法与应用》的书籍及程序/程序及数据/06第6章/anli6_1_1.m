clc, clear
a=textread('data4.txt'); %��ԭʼ���ݱ����ڴ��ı��ļ�data4.txt��
x=a([2:2:6],:)';   %����˿�����
x=nonzeros(x);  %ȥ��������㣬�����������
t=[1790:10:2000]';
t0=t(1); x0=x(1);
fun=@(cs,td)cs(1)./(1+(cs(1)/x0-1)*exp(-cs(2)*(td-t0))); %cs(1)=xm,cs(2)=r
cs=lsqcurvefit(fun,rand(2,1),t(2:end),x(2:end),zeros(2,1))
xhat=fun(cs,[t;2010])  %Ԥ����֪�����2010����˿�
