%�Ӻ�����������ڶ�����m�ļ��У�����ΪLinearReg.m
%���Իع�
function[a,b]=LinearReg(vect1,vect2)
[xxx,n]=size(vect1);
mean_v1=mean(vect1);
mean_v2=mean(vect2);
a=(vect1*vect2'/n-mean_v1*mean_v2)/(vect1*vect1'/n-mean_v1^2);
b=mean_v2-a*mean_v1;
