clc, clear
load data2  %�ֱ����xi�Ĺ۲�ֵx0��yi�Ĺ۲�ֵy0
F=@(cs) 1/sqrt(2*pi)/cs(2)*exp(-(x0-cs(1)).^2/cs(2)^2/2)-y0;
cs0=rand(2,1); %��ϲ����ĳ�ʼֵ������ȡ��
cs=lsqnonlin(F,cs0)
