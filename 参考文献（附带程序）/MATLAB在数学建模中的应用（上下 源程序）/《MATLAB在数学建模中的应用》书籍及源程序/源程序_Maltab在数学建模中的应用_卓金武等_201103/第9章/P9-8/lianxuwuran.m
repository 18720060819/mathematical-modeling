%����������,����Ϊlianxuwuran.m
function Value=lianxuwuran(t)
%���ڿ�ʼ��д������ȾԴģ��
global xx yy zz;
xmin=-500;dx=10;xmax=500;ymin=-100;dy=5;ymax=100;zmin=-10;dz=1;zmax=10;
Cxyz_t((xmax-xmin)/dx+1,(ymax-ymin)/dy+1,(zmax-zmin)/dz+1)=0;
ii=0;jj=0;kk=0;
for zz=zmin:dz:zmax;kk=kk+1;
    for yy=ymin:dy:ymax;jj=jj+1;
        for xx=xmin:dx:xmax;ii=ii+1;
            Cxyz_t(ii,jj,kk)=quadl(@fun3D,1,t);
        end
        ii=0;
    end
        jj=0;
end
Cxyz_tt2=Cxyz_t;
%���ڿ�ʼ��д˲ʱ��Դ��Ⱦģ��
M=200400;K=4.2/(24*60*6);
Dx=50;Dy=5;Dz=2;ux=1.5;uy=0.2;uz=0.1;
[x,y,z]=meshgrid(xmin:dx:xmax,ymin:dy:ymax,zmin:dz:zmax);
C_Point=M./(8.*(pi.*t).^(3./2).*sqrt(Dx.*Dy.*Dz)).*exp(-(x-ux.*t).^2./(4.*Dx.*...
    t)-(y-uy.*t).^2./(4.*Dy.*t)-(z-uz.*t).^2./(4.*Dz.*t)).*exp(-K.*t);
if (t<=30&t>0)
figure(1);
subplot(4,1,1);[c,h]=contour(Cxyz_tt2(:,:,11),200);grid on;
axis tight;title('������ȾԴ������ɢʾ��ͼ(a)');
xlabel('x������Ⱦ��Ũ��/(mg/L)'); ylabel('y������Ⱦ��Ũ��/(mg/L)');
subplot(4,1,2);[c,h]=contour(C_Point(:,:,11),200);grid on;
axis tight;title('˲ʱ��Դ������ɢʾ��ͼ(b)');
xlabel('x������Ⱦ��Ũ��/(mg/L)'); ylabel('y������Ⱦ��Ũ��/(mg/L)');
subplot(4,1,3);[c,h]=contour(Cxyz_tt2(:,:,1),200);grid on;
axis tight;title('������ȾԴˮ��10����ɢʾ��ͼ(c)');
xlabel('x������Ⱦ��Ũ��/(mg/L)'); ylabel('y������Ⱦ��Ũ��/(mg/L)');
subplot(4,1,4);[c,h]=contour(C_Point(:,:,1),200);grid on;
axis tight;title('˲ʱ��Դˮ��10����ɢʾ��ͼ(d)');
xlabel('x������Ⱦ��Ũ��/(mg/L)'); ylabel('y������Ⱦ��Ũ��/(mg/L)');
else t>30
figure(1);
subplot(4,1,1);[c,h]=contour(Cxyz_tt2(:,:,11),8);grid on;
clabel(c,h);axis tight;title('������ȾԴ������ɢʾ��ͼ(a)');
xlabel('x������Ⱦ��Ũ��/(mg/L)'); ylabel('y������Ⱦ��Ũ��/(mg/L)');
subplot(4,1,2);[c,h]=contour(C_Point(:,:,11),8);grid on;
clabel(c,h);axis tight;title('˲ʱ��Դ������ɢʾ��ͼ(b)');
xlabel('x������Ⱦ��Ũ��/(mg/L)'); ylabel('y������Ⱦ��Ũ��/(mg/L)');
subplot(4,1,3);[c,h]=contour(Cxyz_tt2(:,:,1),8);grid on;
clabel(c,h);axis tight;title('������ȾԴˮ��10����ɢʾ��ͼ(c)');
xlabel('x������Ⱦ��Ũ��/(mg/L)'); ylabel('y������Ⱦ��Ũ��/(mg/L)');
subplot(4,1,4);[c,h]=contour(C_Point(:,:,1),8);grid on;
clabel(c,h);axis tight;title('˲ʱ��Դˮ��10����ɢʾ��ͼ(d)');
xlabel('x������Ⱦ��Ũ��/(mg/L)'); ylabel('y������Ⱦ��Ũ��/(mg/L)');
end

