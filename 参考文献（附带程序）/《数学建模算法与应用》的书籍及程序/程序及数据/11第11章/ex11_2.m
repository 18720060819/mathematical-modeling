clc, clear,format long g  %��С������ʾ��ʽ
ab0=load('you.txt');
mu=mean(ab0);sig=std(ab0); %���ֵ�ͱ�׼��
ab=zscore(ab0); %���ݱ�׼��
a=ab(:,[1:7]);b=ab(:,[8:end]);
ncomp=2; %����ѡ��ɷֵĶ���
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats]=plsregress(a,b,ncomp)
n=size(a,2); m=size(b,2); %n���Ա����ĸ���,m��������ĸ���
BETA2(1,:)=mu(n+1:end)-mu(1:n)./sig(1:n)*BETA([2:end],:).*sig(n+1:end); %ԭʼ���ݻع鷽�̵ĳ�����
BETA2([2:n+1],:)=(1./sig(1:n))'*sig(n+1:end).*BETA([2:end],:) %����ԭʼ����x1,...,xn��ϵ����ÿһ����һ���ع鷽��
format  %�ָ�����С������ʾ��ʽ