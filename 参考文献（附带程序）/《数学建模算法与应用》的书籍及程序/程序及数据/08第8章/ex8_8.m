clc, clear
elps=randn(10000,1); x(1:2)=0;
for i=3:10000
    x(i)=-0.6*x(i-1)-0.2*x(i-2)+elps(i); %����ģ������
end
for i=1:3
    m{i}=ar(x,i);   %���ģ��
    myaic(i)=aic(m{i}); %����AIC��ֵ
end
myaic
