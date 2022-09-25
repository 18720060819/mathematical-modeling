clear;close all;
fphn=fopen('hunan.txt','r');
hnb=fgetl(fphn);
hnmap=fscanf(fphn,'%f %f',[2,59]); % It has 59 rows now.����ʡ�羭γ��
fclose(fphn);
hnmap=hnmap';
xa=hnmap(:,[1]);
ya=hnmap(:,[2]);

fp=fopen('LATLON57.txt','r');
LL57=fscanf(fp,'%d %f %f',[3,97]); % It has 97 rows now.����ʡ97�����ƺ��룬��γ��
fclose(fp);
LL57=LL57';
x=LL57(:,[3])/10;
y=LL57(:,[2])/10;


fpy=fopen('etw00100.txt','r');
ymd57=fscanf(fpy,'%d',[3,1]);%ʵ�ڲ��������ʲô��˼�����Һ���Ҳû���õ��������
yu97=fscanf(fpy,'%d %f %f',[3,97]); % It has 97 rows now.����ʡ97���¶�
fclose(fpy);
yu97=yu97';
z=yu97(:,[2]);%����ʡ97���¶�

hold on;
plot(xa,ya,'.','markersize',5,'color','red');%����ʡ��

plot(x,y,'.','markersize',6);%����ʡ97��λ��
[xi,yi]=meshgrid(linspace(min(x),max(x),25),linspace(min(y),max(y),25));
zi=griddata(x,y,z,xi,yi,'cubic');%����ʡ97���¶�������ֵ
hold on;[c,h]=contour(xi,yi,zi,'b-');%�¶ȵ�ֵ�ߣ�ע����ƽ��ĵ�ֵ��
clabel(c,h);hold off;