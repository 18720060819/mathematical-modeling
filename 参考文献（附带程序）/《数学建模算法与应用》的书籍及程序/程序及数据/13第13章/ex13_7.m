f=imread('Lena.bmp');
f=double(f)   %uint8���������޷�������ֵ�ֽ⣬����ת����double����
[u,s,v]=svd(f); %��������ֵ�ֽ�,����sΪ�ԽǾ���
s=diag(s); %����ԽǾ���ĶԽ���Ԫ�أ��õ�һ������
smax=max(s), smin=min(s) %���������ֵ����С����ֵ
s1=s; s1(21:end)=0; %ֻ����ǰ20���������ֵ����������ֵ��0
s1=diag(s1);  %��������ɶԽǾ���
g=u*s1*v';    %����ѹ���Ժ��ͼ�����
g=uint8(g);   %����ת����ԭ�����࣬��ת����uint8��ʽ
imwrite(g,'Lena2.bmp') %��ѹ�����ͼ����󱣴��bmp�ļ�
subplot(1,2,1), imshow('Lena.bmp') %��ʾԭͼ��
subplot(1,2,2), imshow(g) %��ʾѹ�����ͼ��
figure, plot(s,'.','Color','k') %��������ֵ��Ӧ�ĵ�
