%�˳���ʵ������ͼ���ˮӡǶ��
function dwtgl
clc;clear all;close all;
disp('���������׼���������ˮӡͼ�������ĵȴ�����');
input=imread('d:\image.jpg');%��D�������ԭʼͼ��
input_add=input;
water=imread('d:\water1.jpg');%����ˮӡͼ��
water_add=water;
%��ԭʼͼ���ˮӡ��RGB��ɫ����
input=double(input);water=double(water);inputr=input(:,:,1);waterr=water(:,:,1);
inputg=input(:,:,2);waterg=water(:,:,2);inputb=input(:,:,3);waterb=water(:,:,3);
%ϵ��r������³���ԣ������漸�α��κ��������ʧȥˮӡ,����ˮӡ��͸���Խϲ�
r=0.06;
[Cwr,Swr]=WAVEDEC2(waterr,1,'haar');%ˮӡR�ֽ�
[Cr,Sr]=WAVEDEC2(inputr,2,'haar');%ͼ��R�ֽ�
%ˮӡ��Ƕ��
Cr(1:size(Cwr,2)/16)=Cr(1:size(Cwr,2)/16)+r*Cwr(1:size(Cwr,2)/16);
k=0;
while k<=size(Cr,2)/size(Cwr,2)-1
    Cr(1+size(Cr,2)/4+k*size(Cwr,2)/4:size(Cr,2)/4+...
        (k+1)*size(Cwr,2)/4)=Cr(1+size(Cr,2)/4+...
        k*size(Cwr,2)/4:size(Cr,2)/4+(k+1)*size(Cwr,2)/4)+...
        r*Cwr(1+size(Cwr,2)/4:size(Cwr,2)/2); 
     Cr(1+size(Cr,2)/2+k*size(Cwr,2)/4:size(Cr,2)/2+...
        (k+1)*size(Cwr,2)/4)=Cr(1+size(Cr,2)/2+...
        k*size(Cwr,2)/4:size(Cr,2)/2+(k+1)*size(Cwr,2)/4)+...
        r*Cwr(1+size(Cwr,2)/2:3*size(Cwr,2)/4); 
     Cr(1+3*size(Cr,2)/4+k*size(Cwr,2)/4:3*size(Cr,2)/4+...
        (k+1)*size(Cwr,2)/4)=Cr(1+3*size(Cr,2)/4+...
        k*size(Cwr,2)/4:3*size(Cr,2)/4+(k+1)*size(Cwr,2)/4)+...
        r*Cwr(1+3*size(Cwr,2)/4:size(Cwr,2)); 
    k=k+1;
end;
Cr(1:size(Cwr,2)/4)=Cr(1:size(Cwr,2)/4)+r*Cwr(1:size(Cwr,2)/4);
g=0.03;
[Cwg,Swg]=WAVEDEC2(waterg,1,'haar');%ˮӡG�ֽ�
[Cg,Sg]=WAVEDEC2(inputg,2,'haar');%ͼ��G�ֽ�
%ˮӡ��Ƕ��
Cg(1:size(Cwg,2)/16)= Cg(1:size(Cwg,2)/16)+r*Cwg(1:size(Cwg,2)/16);
k=0;
while k<=size(Cg,2)/size(Cwg,2)-1
    Cg(1+size(Cg,2)/4+k*size(Cwg,2)/4:size(Cg,2)/4+...
        (k+1)*size(Cwg,2)/4)=Cg(1+size(Cg,2)/4+...
        k*size(Cwg,2)/4:size(Cg,2)/4+(k+1)*size(Cwg,2)/4)+...
        r*Cwg(1+size(Cwg,2)/4:size(Cwg,2)/2); 
     Cg(1+size(Cg,2)/2+k*size(Cwg,2)/4:size(Cg,2)/2+...
        (k+1)*size(Cwg,2)/4)=Cg(1+size(Cg,2)/2+...
        k*size(Cwg,2)/4:size(Cg,2)/2+(k+1)*size(Cwg,2)/4)+...
        r*Cwg(1+size(Cwg,2)/2:3*size(Cwg,2)/4); 
     Cg(1+3*size(Cg,2)/4+k*size(Cwg,2)/4:3*size(Cg,2)/4+...
        (k+1)*size(Cwg,2)/4)=Cg(1+3*size(Cg,2)/4+...
        k*size(Cwg,2)/4:3*size(Cg,2)/4+(k+1)*size(Cwg,2)/4)+...
        r*Cwg(1+3*size(Cwg,2)/4:size(Cwg,2)); 
    k=k+1;
end;
Cg(1:size(Cwg,2)/4)=Cg(1:size(Cwg,2)/4)+g*Cwg(1:size(Cwg,2)/4);
b=0.12;
[Cwb,Swb]=WAVEDEC2(waterb,1,'haar');%ˮӡB�ֽ�
[Cb,Sb]=WAVEDEC2(inputb,2,'haar');%ͼ��B�ֽ�
%ˮӡ��Ƕ��
Cb(1:size(Cwb,2)/16)=Cb(1:size(Cwb,2)/16)+r*Cwb(1:size(Cwb,2)/16);
k=0;
while k<=size(Cb,2)/size(Cwb,2)-1
    Cb(1+size(Cb,2)/4+k*size(Cwb,2)/4:size(Cb,2)/4+...
        (k+1)*size(Cwb,2)/4)=Cb(1+size(Cb,2)/4+...
        k*size(Cwb,2)/4:size(Cb,2)/4+(k+1)*size(Cwb,2)/4)+...
        r*Cwb(1+size(Cwb,2)/4:size(Cwb,2)/2); 
     Cb(1+size(Cb,2)/2+k*size(Cwb,2)/4:size(Cb,2)/2+...
        (k+1)*size(Cwb,2)/4)=Cb(1+size(Cb,2)/2+...
        k*size(Cwb,2)/4:size(Cb,2)/2+(k+1)*size(Cwb,2)/4)+...
        r*Cwb(1+size(Cwb,2)/2:3*size(Cwb,2)/4); 
     Cb(1+3*size(Cb,2)/4+k*size(Cwb,2)/4:3*size(Cb,2)/4+...
        (k+1)*size(Cwb,2)/4)=Cb(1+3*size(Cb,2)/4+...
        k*size(Cwb,2)/4:3*size(Cb,2)/4+(k+1)*size(Cwb,2)/4)+...
        r*Cwb(1+3*size(Cwb,2)/4:size(Cwb,2)); 
    k=k+1;
end;
Cb(1:size(Cwb,2)/4)=Cb(1:size(Cwb,2)/4)+b*Cwb(1:size(Cwb,2)/4);
%�ù���С���ع�ͼ�������mexh��С���ع�
inputr=waverec2(Cr,Sr,'haar');inputg=waverec2(Cg,Sg,'haar');inputb=waverec2(Cb,Sb,'haar');
%��ɫ�ĵ���
temp=size(inputr);pic=zeros(temp(1),temp(2),3);
for i=1:temp(1);
    for j=1:temp(2);
        pic(i,j,1)=inputr(i,j);
        pic(i,j,2)=inputg(i,j);
        pic(i,j,3)=inputb(i,j);
    end
end
output=uint8(round(pic));
watermarked_image_uint8=uint8(output);%ת��Ϊuint8
imwrite(watermarked_image_uint8,'watermarked.jpg','jpg');
%����ˮӡͼ��
figure(2);subplot(3,1,1);image(input_add);
t1=title('ԭʼͼ��');
set(t1,'fontsize',15,'color',[0 0 0],'fontname','����');
subplot(3,1,2);image(water_add);t2=title('ˮӡͼ��');
set(t2,'fontsize',15,'color',[0 0 0],'fontname','����');
subplot(3,1,3);image(watermarked_image_uint8);t3=title('Ƕ��ˮӡ���ͼ��');
set(t3,'fontsize',15,'color',[0 0 0],'fontname','����');
