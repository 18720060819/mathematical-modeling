clc,clear
a=[9	7	8	8	9	8	7	4	3	6	2	1	6	8	2
8	6	7	5	9	9	5	4	6	3	4	2	4	1	4
7	6	8	5	3	7	6	4	6	3	5	2	5	3	5];
train=a(:,[1:12])';  %�����֪����������,��������˾���ת��
sample=a(:,[13:end])'; %�����������������
group=[ones(7,1);2*ones(5,1)];  %��֪�����ķ���
[x1,y1]=classify(sample,train,group,'mahalanobis') %���Ͼ������
[x2,y2]=classify(sample,train,group,'linear') %���Է���
[x3,y3]=classify(sample,train,group,'quadratic') %���η���
%����classify�ĵڶ�������ֵΪ������
