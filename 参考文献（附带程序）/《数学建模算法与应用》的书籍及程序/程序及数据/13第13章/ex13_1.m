f=imread('tu1.bmp');  %��ԭͼ��
g=imadjust(f,[0; 1],[1; 0]); %����ͼ��ת
subplot(1,2,1), imshow(f) %��ʾԭͼ��
subplot(1,2,2), imshow(g) %��ʾ��תͼ��
