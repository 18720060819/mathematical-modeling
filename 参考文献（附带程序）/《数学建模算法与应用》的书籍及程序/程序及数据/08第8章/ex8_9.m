clc, clear
elps=randn(10000,1); x(1:2)=0;
for i=3:10000
    x(i)=-0.6*x(i-1)-0.2*x(i-2)+elps(i); %����ģ������
end
x=x'; m=ar(x,2);  %���ģ��
xp=predict(m,x);  %������֪���ݵ�Ԥ��ֵ 
res=x-xp{1};  %����в�������Ҳ����ʹ������res=resid(m,x)����в�����
h=lbqtest(res) %�Բв���������Ljung-Box����
