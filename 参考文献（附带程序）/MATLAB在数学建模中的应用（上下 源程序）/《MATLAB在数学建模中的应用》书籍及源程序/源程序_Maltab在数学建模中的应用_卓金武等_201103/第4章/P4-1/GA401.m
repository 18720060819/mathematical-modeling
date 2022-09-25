%���������Ŵ��㷨���y=200*exp(-0.05*x).*sin(x)��[-2 2]�����ϵ����ֵ
clc;
clear all;
close all;
global BitLength
global boundsbegin
global boundsend
bounds=[-2 2];%һά�Ա�����ȡֵ��Χ
precision=0.0001; %���㾫��
boundsbegin=bounds(:,1);
boundsend=bounds(:,2);
%�������������⾫��������Ҫ�೤��Ⱦɫ��
BitLength=ceil(log2((boundsend-boundsbegin)' ./ precision));
popsize=50; %��ʼ��Ⱥ��С
Generationnmax=12;  %������
pcrossover=0.90; %�������
pmutation=0.09; %�������
%������ʼ��Ⱥ
population=round(rand(popsize,BitLength));
%������Ӧ��,������Ӧ��Fitvalue���ۻ�����cumsump
[Fitvalue,cumsump]=fitnessfun(population);  
Generation=1;
while Generation<Generationnmax+1
   for j=1:2:popsize 
      %ѡ�����
      seln=selection(population,cumsump);
      %�������
      scro=crossover(population,seln,pcrossover);
      scnew(j,:)=scro(1,:);
      scnew(j+1,:)=scro(2,:);
      %�������
      smnew(j,:)=mutation(scnew(j,:),pmutation);
      smnew(j+1,:)=mutation(scnew(j+1,:),pmutation);
   end
   population=smnew;  %�������µ���Ⱥ
   %��������Ⱥ����Ӧ��   
   [Fitvalue,cumsump]=fitnessfun(population);
   %��¼��ǰ����õ���Ӧ�Ⱥ�ƽ����Ӧ��
   [fmax,nmax]=max(Fitvalue);
   fmean=mean(Fitvalue);
   ymax(Generation)=fmax;
   ymean(Generation)=fmean;
   %��¼��ǰ�������Ⱦɫ�����
   x=transform2to10(population(nmax,:));
   %�Ա���ȡֵ��Χ��[-2 2],��Ҫ�Ѿ����Ŵ���������Ⱦɫ�����ϵ�[-2 2]����
  xx=boundsbegin+x*(boundsend-boundsbegin)/(power((boundsend),BitLength)-1);
   xmax(Generation)=xx;
   Generation=Generation+1
end
Generation=Generation-1;
Bestpopulation=xx
Besttargetfunvalue=targetfun(xx)
%���ƾ����Ŵ���������Ӧ�����ߡ�һ��أ����������������Ⱥ��ƽ����Ӧ���������
%Ӧ�������������໥��ͬ����̬����ʾ�㷨�������еú�˳����û�г����𵴣�������ǰ
%���£������Ӧ�ȸ����������ɴ���û�з�������������Ⱥ�Ѿ����졣
figure(1);
hand1=plot(1:Generation,ymax);
set(hand1,'linestyle','-','linewidth',1.8,'marker','*','markersize',6)
hold on;
hand2=plot(1:Generation,ymean);
set(hand2,'color','r','linestyle','-','linewidth',1.8,...
'marker','h','markersize',6)
xlabel('��������');ylabel('���/ƽ����Ӧ��');xlim([1 Generationnmax]);
legend('�����Ӧ��','ƽ����Ӧ��');
box off;hold off;
