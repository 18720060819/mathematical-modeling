%΢�ַ��������������
clc;clear all;clf;close all;
%Windowsʱ���Զ���ʱ
T1=clock;%Clock�������ص�ֵ��clock = [year month day hour minute seconds]
disp('���������׼����������л����³´�л����������ĵȴ�����');
[tt,y]=ode45('lbwfun',[0:10:2020],[95.9,0.83,0.003,0.0001,0.0,0.0]);
t=tt(191:end,:)
ys=y(191:end,1)
yp=y(191:end,2)
yh=y(191:end,3)
yr=y(191:end,4)
yo=y(191:end,5)
ye=y(191:end,6)
T2=clock;
API_elapsed_time=T2-T1;
if  API_elapsed_time(6)<0
        API_elapsed_time(6)=API_elapsed_time(6)+60;
        API_elapsed_time(5)=API_elapsed_time(5)-1;
end
if  API_elapsed_time(5)<0
        API_elapsed_time(5)=API_elapsed_time(5)+60;
        API_elapsed_time(4)=API_elapsed_time(4)-1;
end
if  API_elapsed_time(4)<0
        API_elapsed_time(4)=API_elapsed_time(4)+60;
        API_elapsed_time(3)=API_elapsed_time(4)-1;
end 
str=sprintf('�����³´�лģ��������� %d Сʱ %d ���� %.4f ��',...
        API_elapsed_time(4),API_elapsed_time(5),API_elapsed_time(6));
disp(str);
 
