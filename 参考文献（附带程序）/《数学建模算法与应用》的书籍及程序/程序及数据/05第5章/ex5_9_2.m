clc, clear
load data2  %�ֱ����xi�Ĺ۲�ֵx0��yi�Ĺ۲�ֵy0
mf=@(cs,xdata)1/sqrt(2*pi)/cs(2)*exp(-(xdata-cs(1)).^2/cs(2)^2/2);
% yc=mf([2,1],1)  %������������
cs=lsqcurvefit(mf,rand(2,1),x0,y0)  %��ϲ����ĳ�ʼֵ������ȡ��
