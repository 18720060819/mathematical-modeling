clc;close all;clear all;figure(1); 
%������Ӱ����
m=moviein(28); %����洢֡���ڴ�      
a0=int2str(0);
for i=1:9      % ���ζ���1-9������ͼ��
  a=int2str(i);
  a1=strcat('d:\KonghuPanda\KonghuPanda',a0,a0,a,'.jpg');
  X1=imread(a1);imshow(X1);m(i)=getframe;
end
for i=10:28    % ���ζ���10-28������ͼ��
  a2=int2str(i);
  a3=strcat('d:\KonghuPanda\KonghuPanda',a0,a2,'.jpg');
  X2=imread(a3);imshow(X2);m(i)=getframe;
end
movie(m,8);    %���Ŷ���
%���������Ӱ֡
figure(2);
for i=1:9
  subplot(7,4,i);
  a=int2str(i);
  a1=strcat('d:\KonghuPanda\KonghuPanda',a0,a0,a,'.jpg');
  X1=imread(a1);
  image(X1);axis off;box off;
  a4=int2str(i);
  a5=strcat('��',a4,'֡');
  title(a5,'fontsize',9,'fontname','����');
end
for i=10:28
  subplot(7,4,i);
  a2=int2str(i);
  a3=strcat('d:\KonghuPanda\KonghuPanda',a0,a2,'.jpg');
  X2=imread(a3);
  image(X2);axis off;box off;
  a6=int2str(i);
  a7=strcat('��',a6,'֡');
  title(a7,'fontsize',9,'fontname','����');
end
