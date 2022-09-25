function [x,f]=L01p_e(c,A,b,N)
% [x,f]= L01p_e(c,A,b,N)��ö�ٷ��������
%       0-1���Թ滮����
%       min f=c'*x, s.t. A*x<=b,x�ķ���ȫΪ����0��1,
%  ����N��ʾԼ������ Ax �� b�е�ǰN���ǵ�ʽ��N= 0ʱ����ʡ�ԡ�
%  ���ؽ��x�����Ž⣬f�����Ž⴦�ĺ���ֵ��
%  
%�� max f=3x1+5x2+2x3+4x4+2x5+3x6
%   s.t. 8x1+13x2+6x3+9x4+5x5+7x6<=24, x1,��,x6��Ϊ0��1
%���
%  c=-[3,5,2,4,2,3];a=[8,13,6,9,5,7];b=24;
%  x=l01p_e(c,a,b)

% By X.D. Ding�� June 2000

if nargin<4,N=0;end
c=c(:);b=b(:);
[m,n]=size(A);x=[];f=abs(c')*ones(n,1);i=1;
while i<=2^n
   B=de2bi(i-1,n)';
   t=A*B-b;t11=find(t(1:N,:)~=0);
   t12=find(t(N+1:m,:)>0);t1=[t11;t12];
   if isempty(t1)
      f=min([f,c'*B]);
      if c'*B==f,x=B;end
   end
   i=i+1;
end

