clc, clear
f0=imread('tu3.bmp'); %����ͼ��
f1=double(f0); %����ת����double����
for k=1:3
g(:,:,k)=dct2(f1(:,:,k));  %��R��G��B���������ֱ�����ɢ���ұ任
end
g(abs(g)<0.1)=0;  %��DCTϵ��С��0.1�ı��0
for k=1:3
f2(:,:,k)=idct2(g(:,:,k)); %����DCT�任
end
f2=uint8(f2); %������ת����uint8��ʽ
imwrite(f2,'tu4.bmp'); %��f2�����bmp�ļ�
subplot(1,2,1),imshow(f0)
subplot(1,2,2),imshow(f2)
