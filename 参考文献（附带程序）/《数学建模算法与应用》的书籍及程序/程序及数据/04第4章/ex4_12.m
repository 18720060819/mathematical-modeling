clc, clear
x=[0     5    16    20    33    23    35    25    10];
y=[15    20    24    20    25    11     7     0     3];
xy=[x;y];
d=mandist(xy); %��xy��������������ľ���ֵ����
d=tril(d); %��ȡmatlab������Ҫ��������Ǿ���
b=sparse(d) %ת��Ϊϡ�����
[ST,pred]=graphminspantree(b,'Method','Kruskal')  %������С������������
st=full(ST); %����С��������ϡ�����ת������ͨ����
TreeLength=sum(sum(st))  %����С�������ĳ���
view(biograph(ST,[],'ShowArrows','off','ShowWeights','on')) %������С������
