%�ӳ��򣺼�����Ӧ�Ⱥ���, �������ƴ洢Ϊfitnessfun
function [Fitvalue,cumsump]=fitnessfun(population);
global BitLength
global boundsbegin
global boundsend
popsize=size(population,1);   %��popsize������
for i=1:popsize
   x=transform2to10(population(i,:));  %��������ת��Ϊʮ����
    %ת��Ϊ[-2,2]�����ʵ��
xx=boundsbegin+x*(boundsend-boundsbegin)/(power((boundsend),BitLength)-1); 
   Fitvalue(i)=targetfun(xx);  %���㺯��ֵ������Ӧ��
end
%����Ӧ�Ⱥ�������һ����С��������Ա㱣֤��Ⱥ��ӦֵΪ����
Fitvalue=Fitvalue'+230;
%����ѡ�����
fsum=sum(Fitvalue);
Pperpopulation=Fitvalue/fsum;
%�����ۻ�����
cumsump(1)=Pperpopulation(1);
for i=2:popsize
   cumsump(i)=cumsump(i-1)+Pperpopulation(i);
end
cumsump=cumsump';