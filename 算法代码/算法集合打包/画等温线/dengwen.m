clear;close all;
fphn=fopen('hunan.txt','r');
hnb=fgetl(fphn);
hnmap=fscanf(fphn,'%f %f',[2,59]); % It has 59 rows now.湖南省界经纬度
fclose(fphn);
hnmap=hnmap';
xa=hnmap(:,[1]);
ya=hnmap(:,[2]);

fp=fopen('LATLON57.txt','r');
LL57=fscanf(fp,'%d %f %f',[3,97]); % It has 97 rows now.湖南省97县名称号码，经纬度
fclose(fp);
LL57=LL57';
x=LL57(:,[3])/10;
y=LL57(:,[2])/10;


fpy=fopen('etw00100.txt','r');
ymd57=fscanf(fpy,'%d',[3,1]);%实在不懂这句是什么意思，并且后面也没有用到这个变量
yu97=fscanf(fpy,'%d %f %f',[3,97]); % It has 97 rows now.湖南省97县温度
fclose(fpy);
yu97=yu97';
z=yu97(:,[2]);%湖南省97县温度

hold on;
plot(xa,ya,'.','markersize',5,'color','red');%湖南省界

plot(x,y,'.','markersize',6);%湖南省97县位置
[xi,yi]=meshgrid(linspace(min(x),max(x),25),linspace(min(y),max(y),25));
zi=griddata(x,y,z,xi,yi,'cubic');%湖南省97县温度立方插值
hold on;[c,h]=contour(xi,yi,zi,'b-');%温度等值线，注意是平面的等值线
clabel(c,h);hold off;