%%主要程序   前200个点用于训练网络，并且生成三维神经网络图。然后代入后400个点于三维图中，并记录实验数据
% clear all
% close all
% clc
% % tic,
% xlsfile='C:\Users\Administrator\Desktop\误差.xlsx';
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

%绘制预测模型
% [x2,v2]=meshgrid(0:0.02:1); 
% P = [x2(:)';v2(:)'];
% z2 = sim(net,P);
% z2=reshape(z2,51,51);
% surf(x2,v2,z2);
% title('神经网络预测曲面');  
% x1=xlabel('风速');       
% x2=ylabel('主轴转速');        
% x3=zlabel('振动特征值');        
% set(x1,'Rotation',30);    
% set(x2,'Rotation',-30); 
% hold on;
% 代入检测点
% bb=b(11001:13880);
% cc=c(11001:13880);
% dd=d(11001:13880);
% 
% 
% % scatter3(xx,vv,zz)%散点图
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
% legend('RBF神经网络预测','测量值','误差')
% hold off;
% xlabel('时间轴/10min');ylabel('功率');
% title('径向基神经网络预测'); 
g=mean(e1)
n=37;
j=sqrt(sum((Y-t_test).^2)/n) 
c=mean(abs(e1./t_test))
d=sqrt(sum((e1./t_test.^2)/n))
