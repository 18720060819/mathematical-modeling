clc,clear
load sn.txt  %��ԭʼ��x1,x2,x3,x4,y�����ݱ����ڴ��ı��ļ�sn.txt��
[m,n]=size(sn);
x0=sn(:,[1:n-1]);y0=sn(:,n); 
hg1=[ones(m,1),x0]\y0;   %������ͨ��С���˷��ع�ϵ��
hg1=hg1' %�����������ʾ�ع�ϵ��,���е�1�������ǳ����������x1,...,xn����
fprintf('y=%f',hg1(1)); %��ʼ��ʾ��ͨ��С���˷��ع���
for i=2:n
    if hg1(i)>0  
       fprintf('+%f*x%d',hg1(i),i-1);
    else
       fprintf('%f*x%d',hg1(i),i-1)
    end
end
fprintf('\n')  
r=corrcoef(x0)  %�������ϵ������
xd=zscore(x0);  %����ƾ�����б�׼������
yd=zscore(y0);  %��y0���б�׼������
[vec1,lamda,rate]=pcacov(r) %vecΪr������������lamdaΪr������ֵ��rateΪ�������ɷֵĹ�����
f=repmat(sign(sum(vec1)),size(vec1,1),1); %������vecͬά����Ԫ��Ϊ��1�ľ���
vec2=vec1.*f %�޸����������������ţ�ʹ���������������з�����Ϊ��
contr=cumsum(rate)/sum(rate)  %�����ۻ������ʣ���i��������ʾǰi�����ɷֵĹ�����
df=xd*vec2;  %�����������ɷֵĵ÷�
num=input('��ѡ�����ɷֵĸ���:')   %ͨ���ۻ������ʽ���ʽѡ�����ɷֵĸ���
hg21=df(:,[1:num])\yd  %���ɷֱ����Ļع�ϵ��,�����������ݱ�׼�����ع鷽�̵ĳ�����Ϊ0
hg22=vec2(:,1:num)*hg21  %��׼�������Ļع鷽��ϵ��
hg23=[mean(y0)-std(y0)*mean(x0)./std(x0)*hg22, std(y0)*hg22'./std(x0)]  %����ԭʼ�����ع鷽�̵�ϵ��
fprintf('y=%f',hg23(1)); %��ʼ��ʾ���ɷֻع���
for i=2:n
    if hg23(i)>0
        fprintf('+%f*x%d',hg23(i),i-1);
    else
        fprintf('%f*x%d',hg23(i),i-1);
    end
end
fprintf('\n')
%����������ֻع������ʣ���׼��
rmse1=sqrt(sum((hg1(1)+x0*hg1(2:end)'-y0).^2)/(m-n-1))   %�����n+1������
rmse2=sqrt(sum((hg23(1)+x0*hg23(2:end)'-y0).^2)/(m-num)) %�����num������
