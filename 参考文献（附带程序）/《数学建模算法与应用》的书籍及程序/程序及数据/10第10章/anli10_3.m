clc,clear
load ssgs.txt   %��ԭʼ���ݱ����ڴ��ı��ļ�ssgs.txt��
n=size(ssgs,1);
x=ssgs(:,[1:4]); y=ssgs(:,5); %�ֱ�����Ա���x1...x4�������x��ֵ
x=zscore(x); %���ݱ�׼��
r=corrcoef(x)  %�����ϵ������
[vec1,val,con1]=pcacov(r)  %�������ɷַ�������ؼ���
f1=repmat(sign(sum(vec1)),size(vec1,1),1);
vec2=vec1.*f1;     %��������������ת��
f2=repmat(sqrt(val)',size(vec2,1),1); 
a=vec2.*f2   %������غɾ���
num=input('��ѡ�������ӵĸ�����');  %����ʽѡ�������ӵĸ���
am=a(:,[1:num]);  %���num�������ӵ��غɾ���
[bm,t]=rotatefactors(am,'method', 'varimax') %am��ת�任,bmΪ��ת����غ���
bt=[bm,a(:,[num+1:end])];  %��ת��ȫ�����ӵ��غɾ���,ǰ������ת�����治��ת
con2=sum(bt.^2)       %�������ӹ���
check=[con1,con2'/sum(con2)*100]%������������ת����,con1��δ��תǰ�Ĺ�����
rate=con2(1:num)/sum(con2) %�������ӹ�����
coef=inv(r)*bm          %����÷ֺ�����ϵ��
score=x*coef           %����������ӵĵ÷�
weight=rate/sum(rate)  %����÷ֵ�Ȩ��
Tscore=score*weight'   %�Ը����ӵĵ÷ֽ��м�Ȩ��ͣ��������ҵ�ۺϵ÷�
[STscore,ind]=sort(Tscore,'descend')      %����ҵ��������
display=[score(ind,:)';STscore';ind'] %��ʾ������
[ccoef,p]=corrcoef([Tscore,y])    %����F���ʲ���ծ�����ϵ��
[d,dt,e,et,stats]=regress(Tscore,[ones(n,1),y]);%����F���ʲ���ծ�ķ���
d,stats  %��ʾ�ع�ϵ���������ͳ������ֵ
