clc, clear
A=imread('tu5.bmp'); %���������ļ�
W=imread('tu6.bmp');  %����ˮӡ�ļ�
[m1,m2,m3]=size(W);  %��������W��ά��
A0=A([1:m1],[1:m2],:); %�ھ���A�����Ͻ�ѡȡ��Wͬ����С���ӿ�
A0=double(A0); W=double(W); %������������ת��
a=0.05; %Ƕ��ǿ������Ϊ0.05
for i=1:3
    [U1{i},S1{i},V1{i}]=svd(A0(:,:,i)); %������R��G��B��ֱ��������ֵ�ֽ�
    A1(:,:,i)=S1{i}+a*W(:,:,i);  %����A1����
    [U2{i},S2{i},V2{i}]=svd(A1(:,:,i)); %��A1�ĸ����������ֵ�ֽ�
    A2(:,:,i)=U1{i}*S2{i}*V1{i}'; %����A2����
end
AW=A;  %����ˮӡ�ϳ�ͼƬ��ʼ��
AW([1:m1],[1:m2],:)=A2; %���Ͻ��滻��ˮӡ�ϳ��ӿ飬ˮӡǶ�����
AW=uint8(AW); W=uint8(W); %�任��ԭ������������
subplot(1,3,1), imshow(A) %��ʾ����ͼƬ
subplot(1,3,2), imshow(W) %��ʾˮӡͼƬ
subplot(1,3,3), imshow(AW) %��ʾǶ��ˮӡ�ĺϳ�ͼƬ
%������ˮӡ�����
AWstar=imnoise(AW,'gaussian',0,0.01); %�����˹����
A2star=AWstar([1:m1],[1:m2],:);  %����ӿ�
A2star=double(A2star); %������������ת��
for i=1:3
    [U3{i},S2star{i},V3{i}]=svd(A2star(:,:,i)); %����ֵ�ֽ�
    A1star(:,:,i)=U2{i}*S2star{i}*V2{i}';  %����A1*
    Wstar(:,:,i)=(A1star(:,:,i)-S1{i})/a;  %����W*
end
for i=1:3
Wstar(:,:,i)=medfilt2(Wstar(:,:,i));  %����ȡˮӡ��R,G,B��ֱ������ֵ�˲�
end
Wstar=uint8(Wstar); %��������ת��
figure, subplot(1,2,1), imshow(AWstar) %��ʾ��������Ⱦ�ĺϳ�ͼƬ
subplot(1,2,2), imshow(Wstar) %��ʾ�����ˮӡͼƬ
