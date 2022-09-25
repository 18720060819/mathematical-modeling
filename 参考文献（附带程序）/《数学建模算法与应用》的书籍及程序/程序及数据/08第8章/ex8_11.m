clc,clear
randn('state',sum(clock));  %��ʼ�������������
elps=randn(1,10000);   %����10000�����ӱ�׼��̬�ֲ��������
x(1)=0;   %����ʼֵ
for j=2:10000
    x(j)=0.8*x(j-1)+elps(j)-0.4*elps(j-1); %����������
end
x=x'; %ת����������Ҫ��������
for i=0:3
    for j=1:3
        if i==0 & j==0
            continue  %arma(p,q)ģ���У�p,q����ͬʱΪ0
        end
    m=armax(x,[i,j]);  %���ģ�ͣ���֪���ݱ�����������
    myaic=aic(m); %����AICָ��
    fprintf('p=%d,q=%d,AIC=%f\n',i,j,myaic);  %��ʾ������
    end
end
p=input('�������p��');q=input('�������q��'); %����ģ�͵Ľ���
m=armax(x,[p,q])  %���ָ������p,q��ģ��
res=resid(m,x); %����в�����
h=lbqtest(res) %����chi2����
