%99���й���ѧ����ѧ��ģ����a�⣺�Զ�����������ģ��һ
%�μ�����ѧ��ʵ������ʶ��2000.1.p36-40
%���ģ��
clear;
data=normrnd(600*0.95,196.6292*0.95,1,10000);
out=find((data>1200)|(data<=0));
data(out)=[];
leng=length(data);
minfee=inf;
for n=1:20
   for m=310:10:390
      f=jm99asmfun(data,n,m);
      if f<minfee
         minfee=f;
         n0=n;m0=m;
      end
   end
end
n0,m0,minfee

      