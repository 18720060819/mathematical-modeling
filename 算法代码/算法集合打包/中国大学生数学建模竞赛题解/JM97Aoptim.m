function [f,g]=JM97Aoptim(x)
% 97���й���ѧ����ѧ��ģ����A��Ŀ�꺯��
% �÷��� [f,g]=jm97aoptim(x)
%       x--7���������
%       f--Ŀ�꺯��
%       g--����������Ż�������ʵ��
%       ȫ�̱�����COST(�ɱ����󣩣�VARI(�ݲ�ȼ���
% ���M�ļ���jm97a, jm97afun

global COST VARI;
y=jm97afun(x);
sig=0;h=0.0001;
for i=1:7
   xh=x;xh(i)=x(i)+h;
   dy=(jm97afun(xh)-jm97afun(x))/h;
   sig=sig+dy^2*(VARI(i)/300*x(i))^2;
end
sig=sig^0.5;
f=9000-8000*(normcdf(1.8,y,sig)-normcdf(1.2,y,sig))...
   -1000*(normcdf(1.6,y,sig)-normcdf(1.4,y,sig));
gra=[10 5 1];
for i=1:7
   f=f+sum((VARI(i)==gra).*COST(i,:));
end
g=-1;