clc, clear
x2=@(qujian,lb,ub,x)(1-(qujian(1)-x)./(qujian(1)-lb)).*(x>=lb & x<qujian(1))+...
    (x>=qujian(1) & x<=qujian(2))+(1-(x-qujian(2))./(ub-qujian(2))).*...
    (x>qujian(2) & x<=ub); %����任����������,�����̫����ʹ�����������з�
qujian=[5,6]; lb=2; ub=12; %�������䣬�޷������½���Ͻ�
x2data=[5 6 7 10 2]'; %x2����ֵ
y2=x2(qujian,lb,ub,x2data) %���������������������ݱ任
