clc,clear
r=[1 -1/3 2/3;-1/3 1 0;2/3 0 1];
%�����������ϵ�����������ɷֽ⣬vec1����Ϊr�����������������ɷֵ�ϵ��
[vec1,val,rate]=pcacov(r) %valΪr������ֵ��rateΪ�������ɷֵĹ�����
f1=repmat(sign(sum(vec1)),size(vec1,1),1); %������vec1ͬά����Ԫ��Ϊ��1�ľ���
vec2=vec1.*f1; %�޸����������������ţ�ÿ�����������������з����͵ķ��ź���ֵ
f2=repmat(sqrt(val)',size(vec2,1),1);
lambda=vec2.*f2    %����ȫ�����ӵ��غɾ��󣬼���10.27��ʽ 
num=2;  %ѡ������������
[lambda2,t]=rotatefactors(lambda(:,1:num),'method', 'varimax')  %���غɾ��������ת
%����lambda2Ϊ��ת�غɾ���tΪ�任����������
