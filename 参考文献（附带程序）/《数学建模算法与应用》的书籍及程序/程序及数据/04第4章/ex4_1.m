clc,clear
a=zeros(6); %�ڽӾ����ʼ��
a(1,2)=50;a(1,4)=40;a(1,5)=25;a(1,6)=10;
a(2,3)=15;a(2,4)=20;a(2,6)=25;
a(3,4)=10;a(3,5)=20;
a(4,5)=10;a(4,6)=25;
a(5,6)=55;
a=a+a';
a(find(a==0))=inf;
pb(1:length(a))=0;pb(1)=1;index1=1;index2=ones(1,length(a));
d(1:length(a))=inf;d(1)=0;
temp=1; %���µ�P��ŵĶ���
while sum(pb)<length(a)
   tb=find(pb==0);
   d(tb)=min(d(tb),d(temp)+a(temp,tb));
   tmpb=find(d(tb)==min(d(tb)));
   temp=tb(tmpb(1)); %�����ж����ͬʱ�ﵽ��Сֵ��ֻȡ���е�һ��
   pb(temp)=1;
   index1=[index1,temp];
   temp2=find(d(index1)==d(temp)-a(temp,index1));
   index2(temp)=index1(temp2(1));
end
d, index1, index2
