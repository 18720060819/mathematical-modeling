f=imread('Lena.bmp'); %��ԭͼ��
f1=imnoise(f,'salt & pepper',0.02); %�ӽ�������
g=medfilt2(f1); %������ֵ�˲�
subplot(1,3,1),imshow(f),title('ԭͼ��')
subplot(1,3,2),imshow(f1),title('������������Ⱦ��ͼ��')
subplot(1,3,3),imshow(g),title('��ֵ�˲�ͼ��')
