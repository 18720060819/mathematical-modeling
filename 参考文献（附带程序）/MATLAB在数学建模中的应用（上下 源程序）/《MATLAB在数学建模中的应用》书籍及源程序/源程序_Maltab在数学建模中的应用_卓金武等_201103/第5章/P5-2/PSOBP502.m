function main
clc;clear all;close all;
MaxRunningTime=1; %�ò�����Ϊ��ʹ���缯�ɣ��ظ�ѵ��MaxRunningTime��
HiddenUnitNum=12;
rand('state',sum(100*clock));
TrainSamIn=-4:0.07:2.5;
TrainSamOut=1.1*(1-TrainSamIn+2*TrainSamIn.^2).*exp(-TrainSamIn.^2/2);
TestSamIn=2:0.04:3;
TestSamOut=1.1*(1-TestSamIn+2*TestSamIn.^2).*exp(-TestSamIn.^2/2);
[xxx,TrainSamNum]=size(TrainSamIn);
[xxx,TestSamNum]=size(TestSamIn);
% for HiddenUnitNum=3:MaxHiddenLayerNode %��������Ԫ�ĸ�������ȡ������ĺ�������
    fprintf('\n the hidden layer node');HiddenUnitNum
    TrainNNOut=[];
    TestNNOut=[];
    for t=1:MaxRunningTime
        fprintf('the current running times is');t
        [NewW1,NewB1,NewW2,NewB2]=PSOTrain(TrainSamIn,TrainSamOut,HiddenUnitNum);
        disp('PSO�㷨ѵ�������������BP�㷨����ѵ�����硭��');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BP�㷨������ʼ����ע��������PSO����һ��
SamInNum=length(TrainSamIn);
TestSamNum=length(TestSamIn);
InDim=1;
OutDim=1;
%ѧϰ�����������
rand('state',sum(100*clock))
NoiseVar=0.01;
Noise=NoiseVar*randn(1,SamInNum);
SamIn=TrainSamIn;
SamOutNoNoise=TrainSamOut;
SamOut=SamOutNoNoise + Noise;
MaxEpochs=300;
lr=0.003;
E0=0.0001;
W1=NewW1;
B1=NewB1;
W2=NewW2';
B2=NewB2;
W1Ex=[W1 B1];
W2Ex=[W2 B2];
SamInEx=[SamIn' ones(SamInNum,1)]';
ErrHistory=[];
%���������ʼ�����
%��������ʼ��ͼ�͹���������ܺͱ���
HiddenOut=logsig(W1Ex*SamInEx);
HiddenOutEx=[HiddenOut' ones(SamInNum,1)]';
NetworkOut=W2Ex*HiddenOutEx;
Error=SamOut-NetworkOut;
%�����Ķ�����ʾ�ṩ�վ������ά��
SSEINIT=zeros(1,MaxEpochs);
%������������һά�����
SSE=sumsqr(Error);
%�滭������ʾ��ͼ�ο��
figure(1);
rangecolour=linspace(0,1,MaxEpochs);
%���÷�����ͼ��������������һ��figure����ʾ
%�Ȼ���һ��ͼ��
subplot(2,1,1);
hold on
axis([1 SamInNum min(SamOut) max(SamOut)]);
hflash1=line(1:SamInNum,SamOut,'color',[rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','-','linewidth',2,'marker','d',...
    'markersize',2,'erasemode','none');
hflash2=line(1:SamInNum,NetworkOut,'color',[rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','-','linewidth',2.5,'marker','h',...
    'markersize',2.3,'erasemode','xor');
xlabel('ѵ����������Ŀ');
ylabel('���������ֵ����������ֵ');
title('���������ֵ����������ֵ������ʾ','fontsize',13);
legend('���������ֵ','��������ֵ');
hold off
%�ٻ��ڶ���ͼ��
subplot(2,1,2);
hold on
axis([1 MaxEpochs -0.2*SSE SSE]);
hflash3=line(1:MaxEpochs,E0*ones(1,MaxEpochs),'color',...
    [rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','--','linewidth',2,'marker','h',...
    'markersize',2,'erasemode','none');
hflash4=line(1,SSE,'color',...
    [rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','-','linewidth',2,'marker','*',...
    'markersize',2,'erasemode','xor');
xlabel('����ѵ������');
ylabel('Ŀ����������������');
title('Ŀ��������������������ʾ','fontsize',13);
legend('Ŀ�����','����������');
hold off

for i=2:MaxEpochs
    HiddenOut=logsig(W1Ex*SamInEx);
    HiddenOutEx=[HiddenOut' ones(SamInNum,1)]';
    NetworkOut=W2Ex*HiddenOutEx;
    
    Error=SamOut-NetworkOut;
    SSE=sumsqr(Error)
 %�õڶ������������ʾ
          SSEINIT(:,i)=SSE;
%����������ѵ�������з����𵴵�˲��ͼ������ʾ����
  ErrHistory=[ErrHistory SSE];
  SSEINIT(:,1);
  SSEINIT(:,2);
  SSEINIT2=SSEINIT(:,i);
  SSEINIT1=SSEINIT(:,i-1);
if SSE<E0,break, end   
    Delta2=Error;
    Delta1=W2'*Delta2.*HiddenOut.*(1-HiddenOut);

    dW2Ex=Delta2*HiddenOutEx';
    dW1Ex=Delta1*SamInEx';

    W1Ex=W1Ex+lr*dW1Ex;
    W2Ex=W2Ex+lr*dW2Ex;
    W2=W2Ex(:,1:HiddenUnitNum);
    if SSEINIT2>SSEINIT1
%�������ѧϰʱ�����𵴣�ÿ10����ʾһ��
    if mod(i,10)==0
        Counter(i)=SSEINIT(:,i);
        Len=size(Counter);
        figure(Len(1,2));
       subplot(2,1,1);
      hold on
axis([1 SamInNum min(SamOut) max(SamOut)]);
hflash5=line(1:SamInNum,SamOut,'color',[rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','-','linewidth',2,'marker','d',...
    'markersize',2,'erasemode','none');
hflash6=line(1:SamInNum,NetworkOut,'color',[rangecolour(MaxEpochs) 0 1-rangecolour(MaxEpochs)],...
    'linestyle','-','linewidth',2.5,'marker','h',...
    'markersize',2.3,'erasemode','xor');
xlabel('ѵ����������Ŀ');
ylabel('���������ֵ����������ֵ');
title('������ѧϰ��ʱ�������','fontsize',13);
legend('���������ֵ','��������ֵ');
hold off
%�ٻ��ڶ���ͼ��
subplot(2,1,2);
hold on
axis([1 MaxEpochs -2*SSEINIT(:,2) 2*SSEINIT(:,2)]);
hflash7=line(1:MaxEpochs,E0*ones(1,MaxEpochs),'color',...
    [rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','--','linewidth',2,'marker','h',...
    'markersize',2,'erasemode','none');
hflash8=line(1:i,SSEINIT(:,1:i),'color',...
    [rangecolour(1) 0 1-rangecolour(1)],...
    'linestyle','-','linewidth',2,'marker','*',...
    'markersize',2,'erasemode','xor');
xlabel('����ѵ������');
ylabel('Ŀ����������������');
title('������ѧϰ��ʱ���','fontsize',13);
legend('Ŀ�����','����������');
hold off
    end
    end
%������ʼ��ӳ    
set(hflash2,'XData',1:SamInNum,'YData',NetworkOut,'color',...
    [rangecolour(MaxEpochs) 0 1-rangecolour(MaxEpochs)]);
set(hflash4,'XData',1:i,'YData',SSEINIT(:,1:i),...
    'color',[rangecolour(MaxEpochs) 0 1-rangecolour(MaxEpochs)]);
drawnow;                       
end

W2=W2Ex(:,1:HiddenUnitNum);
W1=W1Ex(:,1:InDim);
B1=W1Ex(:,InDim+1);
B2=W2Ex(:,1+HiddenUnitNum); 
TrainHiddenOut=logsig(W1*SamIn+repmat(B1,1,SamInNum));
TrainNNOut=W2*TrainHiddenOut+repmat(B2,1,SamInNum);
TestHiddenOut=logsig(W1*TestSamIn+repmat(B1,1,TestSamNum));
TestNNOut=W2*TestHiddenOut+repmat(B2,1,TestSamNum);

figure(MaxEpochs+1);
hold on;
grid;
h1=plot(SamIn,SamOut);
set(h1,'color','r','linestyle','-',...
    'linewidth',2.5,'marker','p','markersize',5);
hold on 
h2=plot(TestSamIn,TestSamOut);
set(h2,'color','g','linestyle','--',...
    'linewidth',2.5,'marker','^','markersize',7);
h3=plot(SamIn,TrainNNOut);
set(h3,'color','c','linestyle','-.',...
    'linewidth',2.5,'marker','o','markersize',5);
h4=plot(TestSamIn,TestNNOut);
set(h4,'color','m','linestyle',':',...
    'linewidth',2.5,'marker','s','markersize',5);
xlabel('Input x','fontsize',13);ylabel('Output y','fontsize',13);
box on;axis tight;
%title('PSO-BP������������ͼ');
legend('����ѧϰʵ������ֵ','�������ʵ������ֵ',...
    '����ѧϰ�������ֵ','��������������ֵ');
hold off;
    end
% end
fidW1=fopen('d:\W1.txt','a+');fidB1=fopen('d:\B1.txt','a+');
fidW2=fopen('d:\W2.txt','a+');fidB2=fopen('d:\B2.txt','a+');
for i=1:length(W1)
    fprintf(fidW1,'\n %6.5f',W1(i));
end
for i=1:length(B1)
    fprintf(fidB1,'\n %6.5f',B1(i));
end
for i=1:length(W2)
    fprintf(fidW2,'\n %6.5f',W2(i));
end
for i=1:length(B2)
    fprintf(fidB2,'\n %6.5f',B2(i));
end
fclose(fidW1);fclose(fidB1);fclose(fidW2);fclose(fidB2);
