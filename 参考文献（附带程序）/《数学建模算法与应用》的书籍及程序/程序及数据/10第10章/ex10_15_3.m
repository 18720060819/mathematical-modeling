clc,clear
p1=6/14;p2=8/14;
a=[24.8   24.1   26.6  23.5   25.5  27.4
-2.0  -2.4   -3.0   -1.9   -2.1   -3.1]';
b=[22.1  21.6   22.0  22.8   22.7  21.5   22.1   21.4
-0.7  -1.4   -0.8  -1.6   -1.5  -1.0  -1.2  -1.3]';
n1=6;n2=8;
train=[a;b];  %trainΪ��֪����
group=[ones(n1,1);2*ones(n2,1)]; %��֪��������ʶ
prior=[p1; p2]; %��֪�������������
sample=train; %sampleһ��Ϊδ֪������������׼���ش���������
[x1,y1]=classify(sample,train,group,'linear',prior) %���Է���
[x2,y2]=classify(sample,train,group,'quadratic',prior) %���η���
%����classify�ĵڶ�������ֵΪ������
