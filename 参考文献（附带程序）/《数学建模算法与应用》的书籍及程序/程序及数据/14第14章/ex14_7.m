clc, clear
aw=load('zhb.txt'); %��x1,...,x6�����ݺ�Ȩ�����ݱ����ڴ��ı��ļ�zhb.txt��
w=aw(end,:); %��ȡȨ������
a=aw([1:end-1],:); %��ȡָ������
a(:,[2,6])=-a(:,[2,6]); %�ѳɱ���ָ��ת����Ч����ָ��
ra=tiedrank(a) %��ÿ��ָ��ֵ�ֱ���ȣ�����a��ÿһ�зֱ����
[n,m]=size(ra); %�������sa��ά��
RSR=mean(ra,2)/n  %�����Ⱥͱ�
W=repmat(w,[n,1]);
WRSR=m*mean(ra.*W,2)/n  %�����Ȩ�Ⱥͱ�
p=[1:n]/n;    %�����ۻ�Ƶ��
p(end)=1-1/(4*n) %�������һ���ۻ�Ƶ�ʣ����һ���ۻ�Ƶ�ʰ�1-1/(4*n)����
Probit=norminv(p,0,1)+5  %�����׼��̬�ֲ���p��λ��+5
X=[ones(n,1),Probit'];  %����һԪ���Իع���������ݾ���
[ab,abint,r,rint,stats]=regress(WRSR,X)  %һԪ���Իع����
WRSRfit=ab(1)+ab(2)*Probit  %����WRNR�Ĺ���ֵ
[sWRSRfit,ind]=sort(WRSRfit,'descend')  %��WRNR�Ĺ���ֵ���մӴ�С����
