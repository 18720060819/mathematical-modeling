clc, clear
a=load('jingliu.txt'); %�ѱ��е�2�е���6�е����ݱ��浽���ı��ļ�jingliu.txt
a=a'; %ע������������ݸ�ʽ����Ҫ�Ѿ����ת���ˡ�
P=a([1:4],[1:end-1]); [PN,PS1]=mapminmax(P); %�Ա������ݹ�񻯵�[-1,1]
T=a(5,[1:end-1]);  [TN,PS2]=mapminmax(T); %��������ݹ�񻯵�[-1,1]
net1=newrb(PN,TN)  %ѵ��RBF����
x=a([1:4],end); xn=mapminmax('apply',x,PS1); %Ԥ���������Ա������
yn1=sim(net1,xn); y1=mapminmax('reverse',yn1,PS2) %��Ԥ��ֵ���������ݻ�ԭ
delta1=abs(a(5,20)-y1)/a(5,20)  %����RBF����Ԥ���������
net2=feedforwardnet(4);  %��ʼ��BP���磬���������ԪȡΪ4����������飩
net2 = train(net2,PN,TN); %ѵ��BP����
yn2= net2(xn); y2=mapminmax('reverse',yn2,PS2)  %��Ԥ��ֵ���������ݻ�ԭ
