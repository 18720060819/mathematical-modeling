clc,clear
x=load('water.txt');  %��ԭʼ���ݰ��ձ��еĸ�ʽ����ڴ��ı��ļ�water.txt
x=x'; x=x(:);  %����ʱ����Ⱥ���򣬰����ݱ��������
s=12;  %����s=12
n=12;  %Ԥ�����ݵĸ���
m1=length(x);   %ԭʼ���ݵĸ���
for i=s+1:m1
    y(i-s)=x(i)-x(i-s); %�������ڲ�ֱ任
end
w=diff(y);   %���������ԵĲ������
m2=length(w); %�������ղ�ֺ����ݵĸ���
for i=0:3
    for j=0:s+1
    spec= garchset('R',i,'M',j,'Display','off'); %ָ��ģ�͵Ľṹ
    [coeffX,errorsX,LLFX] = garchfit(spec,w);  %��ϲ���
    num=garchcount(coeffX);   %������ϲ����ĸ���
    [aic,bic]=aicbic(LLFX,num,m2); %����Akaike��Bayesian��Ϣ׼�� 
    fprintf('R=%d,M=%d,AIC=%f,BIC=%f\n',i,j,aic,bic);  %��ʾ������
    end
end
r=input('�������p��');m=input('�������q��');
spec2= garchset('R',r,'M',m,'Display','off'); %ָ��ģ�͵Ľṹ
[coeffX,errorsX,LLFX] = garchfit(spec2,w)  %��ϲ���
[sigmaForecast,w_Forecast] = garchpred(coeffX,w,n)  %��w��Ԥ��ֵ
yhat=y(end)+cumsum(w_Forecast)     %��y��Ԥ��ֵ
for j=1:n
    x(m1+j)=yhat(j)+x(m1+j-s); %��x��Ԥ��ֵ
end
xhat=x(m1+1:end)   %��ȡn��Ԥ��ֵ
