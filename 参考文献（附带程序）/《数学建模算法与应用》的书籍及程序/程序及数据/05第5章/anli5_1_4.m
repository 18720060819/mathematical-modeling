clc,clear
load data3.txt  %�ѱ�5.8�е����ں�ʱ��������ɾ�������µ����ݱ����ڴ��ı��ļ�
liu=data3([1,3],:); liu=liu'; liu=liu(:);  %���ˮ����������˳����������
sha=data3([2,4],:); sha=sha'; sha=sha(:); %�����ɳ��������˳����������
y=sha.*liu;   %������ɳ����������������
format long e 
%�����ǵ�һ�׶ε����
for j=1:2
nihe1{j}=polyfit(liu(1:11),y(1:11),j);%��϶���ʽ��ϵ�����дӸߴ��ݵ��ʹ���
yhat1{j}=polyval(nihe1{j},liu(1:11));  %��Ԥ��ֵ
%���������ƽ������ʣ���׼��
cha1(j)=sum((y(1:11)-yhat1{j}).^2); rmse1(j)=sqrt(cha1(j)/(10-j));
end
nihe1{:}  %��ʾϸ�����������Ԫ��
rmse1
%�����ǵڶ��׶ε����
for j=1:3
    nihe2{j}=polyfit(liu(12:24),y(12:24),(j+1)); %����ʹ��ϸ������
    yhat2{j}=polyval(nihe2{j},liu(12:24)); 
    rmse2(j)=sqrt(sum((y(12:24)-yhat2{j}).^2)/(11-j)); %��ʣ���׼��
end
nihe2{:}  %��ʾϸ�����������Ԫ��
rmse2
format  %�ָ�Ĭ�ϵĶ�С������ʾ��ʽ
