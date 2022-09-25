clc, clear
cm=imread('cameraman.tif'); %����Matlab������ͼ���ļ�
[n,m]=size(cm); %����ͼ���ά��
cf=fft2(cm); %���и��ϱ任
cf=fftshift(cf); %�������ı任
u=[-floor(m/2):floor((m-1)/2)] %ˮƽƵ��
v=[-floor(n/2):floor((n-1)/2)] %��ֱƵ��
[uu,vv]=meshgrid(u,v); %Ƶ��ƽ���ϵ�������
bl=1./(1+(sqrt(uu.^2+vv.^2)/15).^2); %����1�װ������ȵ�ͨ�˲���
cfl=bl.*cf; %�����ˣ����е�ͨ�˲�
cml=real(ifft2(cfl)); %�����渵�ϱ任����ȡʵ��
%cml=ifftshift(cml);
cml=uint8(cml); %����������ݸ�ʽת��
subplot(1,2,1), imshow(cm)  %��ʾԭͼ��
subplot(1,2,2), imshow(cml) %��ʾ�˲����ͼ��
