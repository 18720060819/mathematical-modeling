% ��ɫģ��������
clear
clc;close all;
p=[];
q=[];
k=[];
%�����ļ�data1.txt�����У���һ����ʱ�䣬�ڶ����ǹ�ˮ��
A=load('d:\data1.txt');
  n=size(A);
 A=A';
 B=[];
for i=0:10000:60000         %����ѭ����Ŀ����������2000�굽2006��
   for j=1:n                  %����ѭ�������Ѱ��
     if A(1,j)==20000101+i  %����ѭ��������1�·ݵ�ÿ�չ�ˮ�����ݿٳ���
         B=[B;A(2,j:j+30)];
        end
     end
end

%06��1�¡�07��1�µ�Ԥ������
for i=1:31
     [y,p]=gm_1_1([B(1:6,i)'],2);
  q=[q,p(1,1)];         %06��1�µ�Ԥ������
  k=[k,p(1,2)]          %07��1�µ�Ԥ������
end

%��2006��һ�·ݵ�������Ϊ��ɫģ�͵ļ�������
errorss=abs((B(7,:)-q)./B(7,:))*100
t=1:31;
figure(1);
h1=plot(t,errorss);
set(h1,'color',[1 0 0],'linestyle','-',...
    'linewidth',2.5,'marker','p','markersize',4);
xlabel('ʱ��/��');
ylabel('Ԥ�����ٷֱ�/%');
text(30,5.5,'');axis tight;grid on;
title('06��1�·�����ˮ��Ԥ��ֵ��ʵ��ֵ���ٷֱ�');

figure(2);
h2=plot(t,k);
set(h2,'color',[0 0 1],'linestyle','-.',...
    'linewidth',2.5,'marker','^','markersize',4);
xlabel('ʱ��/��');
ylabel('����ˮ��/��');
axis tight;grid on;
title('07��1�·�����ˮ��Ԥ��ֵ');




