%����û��ʹ��ѭ�������ǽ������ʸ����
%��������ǰ�ڡ�file���˵��¡�preferences���������ʽ���ɡ�long����ʽ
clc;
clear all;
n=1000000;
a=rand(n,1);
%������randָ���������randnָ����Ϊ����������������Ǿ��ȵ�
b=rand(n,1);
c=find(a.^2+b.^2<=1);
d=length(c);
pi_value=d/n*4
