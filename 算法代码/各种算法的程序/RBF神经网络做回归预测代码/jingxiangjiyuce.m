%%��Ҫ����   ǰ200��������ѵ�����磬����������ά������ͼ��Ȼ������400��������άͼ�У�����¼ʵ������
% clear all
% close all
% clc
% % tic,
% xlsfile='C:\Users\Administrator\Desktop\���.xlsx';
% [xji]=xlsread(xlsfile,'Sheet1','A1:A13880');
% [yji]=xlsread(xlsfile,'Sheet1','B1:B13880');
% [feng]=xlsread(xlsfile,'Sheet1','C1:C13880');
% 
% 
% [b,ps]=mapminmax(xji',0,1);
% [c,ps]=mapminmax(yji',0,1);
% [d,ps]=mapminmax(feng',0,1);

% t=b(1:11000);
% u=c(1:11000);
% v=d(1:11000);                        
% 
% p1=[t;u];
% t1=v;
clc;
A=untitled;
x1=A(1:157,1);
x2=A(2:158,1);
x3=A(3:159,1);
p1=[x1 x2 x3]';
t1=A(4:160,1)';
% spread=80000;  
% net=newrbe(p1,t1,spread);

net=newff(p1,t1);
% toc

%����Ԥ��ģ��
% [x2,v2]=meshgrid(0:0.02:1); 
% P = [x2(:)';v2(:)'];
% z2 = sim(net,P);
% z2=reshape(z2,51,51);
% surf(x2,v2,z2);
% title('������Ԥ������');  
% x1=xlabel('����');       
% x2=ylabel('����ת��');        
% x3=zlabel('������ֵ');        
% set(x1,'Rotation',30);    
% set(x2,'Rotation',-30); 
% hold on;
% �������
% bb=b(11001:13880);
% cc=c(11001:13880);
% dd=d(11001:13880);
% 
% 
% % scatter3(xx,vv,zz)%ɢ��ͼ
% % hold off;
% P_test=[bb;cc];
% t_test=dd;
test_x1=A(161:197,1);
test_x2=A(162:198,1);
test_x3=A(163:199,1);
P_test=[test_x1 test_x2 test_x3]';
t_test=A(164:200,1)';

Y=sim(net,P_test);
Z=Y';
e1=abs(Y-t_test);
% figure(2)
% ll1=(1:1:37);
% plot(ll1,dd,'b');
% hold on;
% plot(ll1,Y,'r');
% hold on;
% plot(ll1,e1,'m');
% legend('RBF������Ԥ��','����ֵ','���')
% hold off;
% xlabel('ʱ����/10min');ylabel('����');
% title('�����������Ԥ��'); 
g=mean(e1)
n=37;
j=sqrt(sum((Y-t_test).^2)/n) 
c=mean(abs(e1./t_test))
d=sqrt(sum((e1./t_test.^2)/n))
