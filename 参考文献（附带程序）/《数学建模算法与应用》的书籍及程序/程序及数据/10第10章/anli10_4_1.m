clc,clear
load sy.txt   %��ԭʼ���ݱ����ڴ��ı��ļ�sy.txt��
sy=zscore(sy); %���ݱ�׼��
r=cov(sy);  %���׼�����ݵ�Э�����󣬼������ϵ������
[vec1,val,con]=pcacov(r)  %�������ɷַ�������ؼ���
f1=repmat(sign(sum(vec1)),size(vec1,1),1);
vec2=vec1.*f1;     %��������������ת��
f2=repmat(sqrt(val)',size(vec2,1),1); 
a=vec2.*f2   %������غɾ���
num=input('��ѡ�������ӵĸ�����');  %����ʽѡ�������ӵĸ���
am=a(:,[1:num]);  %���num�������ӵ��غɾ���
[b,t]=rotatefactors(am,'method', 'varimax') %��ת�任,bΪ��ת����غ���
bt=[b,a(:,[num+1:end])];   %��ת��ȫ�����ӵ��غɾ���
degree=sum(b.^2,2)     %���㹲ͬ��
contr=sum(bt.^2)       %�������ӹ���
rate=contr(1:num)/sum(contr) %�������ӹ�����
coef=inv(r)*b          %����÷ֺ�����ϵ��
