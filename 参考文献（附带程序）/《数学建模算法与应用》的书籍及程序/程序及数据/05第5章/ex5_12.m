syms x
base=[1,x^2,x^4];
y1=base.'*base
y2=cos(x)*base.'
r1=int(y1,-pi/2,pi/2)
r2=int(y2,-pi/2,pi/2)
a=r1\r2
xishu1=double(a)  %��������ת������ֵ������
xishu2=vpa(a,6)   %�ѷ�������ת����С���͵ķ�������
