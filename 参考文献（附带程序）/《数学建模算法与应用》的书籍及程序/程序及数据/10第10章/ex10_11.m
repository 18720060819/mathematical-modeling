clc,clear
r=[1 1/5 -1/5;1/5 1 -2/5;-1/5 -2/5 1];
n=size(r,1); rt=abs(r); %�����r����Ԫ�صľ���ֵ
rt(1:n+1:n^2)=0; %��rt����ĶԽ���Ԫ�ػ���0
rstar=r; %R*��ʼ��
rstar(1:n+1:n^2)=max(rt'); %�Ѿ���rstar�ĶԽ���Ԫ�ػ���rt������е����ֵ 
%��������R*�����������ӽ⣬vec1����Ϊ����rstar����������
[vec1,val,rate]=pcacov(rstar)  %valΪrstar������ֵ��rateΪ�������ɷֵĹ�����
f1=repmat(sign(sum(vec1)),size(vec1,1),1);
vec2=vec1.*f1     %��������������ת��
f2=repmat(sqrt(val)',size(vec2,1),1);
a=vec2.*f2   %���������غɾ���
num=input('��ѡ�񹫹����ӵĸ�����');  %����ʽѡȡ�����ӵĸ���
aa=a(:,1:num)   %���num�����ӵ��غɾ���
s1=sum(aa.^2)   %�����X�Ĺ�����
s2=sum(aa.^2,2)  %���㹲ͬ��
