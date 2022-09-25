%���ڵ�ϳ��������������
function main()
clc;close all;clear all;
InDim=3;               %����ά��
OutDim=1;              %���ά��
Hidden1UnitNum=7;      %��һ������ڵ���
Hidden2UnitNum=5;      %�ڶ�������ڵ���
AllSamNum=93;          %����ѵ���Ͳ�����������
TrainDataNum=83;       %ѵ����������
TestDataNum=10;        %������������

%�����ڴ�ռ�
TrainDataIn=[];
TrainDataOut=[];
TestDataIn=[];
TestDataOut=[];
%��D�̶���ѧϰ�����Ժ�Ԥ�����������
TrainTest=load('d:\water.txt');
TrainTest=TrainTest';
PredictDataIn=load('d:\third.txt');
PredictDataIn=PredictDataIn';

%���������ݽ��г�ʼ����������0.1~0.9����
SampleCombin=[TrainTest(1:3,:) PredictDataIn];
A1=max(SampleCombin(1,:));
B1=min(SampleCombin(1,:));
A2=max(SampleCombin(2,:));
B2=min(SampleCombin(2,:));
A3=max(SampleCombin(3,:));
B3=min(SampleCombin(3,:));
C=max(TrainTest(4,:));
D=min(TrainTest(4,:));
InitSampleCombin1=0.8*(SampleCombin(1,:)-B1)/(A1-B1)+0.1;
InitSampleCombin2=0.8*(SampleCombin(2,:)-B2)/(A2-B2)+0.1;
InitSampleCombin3=0.8*(SampleCombin(3,:)-B3)/(A3-B3)+0.1;
InitTrainTestDataOut=0.8*(TrainTest(4,:)-D)/(C-D)+0.1;
SampleCombin=[InitSampleCombin1;InitSampleCombin2;InitSampleCombin3];

TrainDataIn=SampleCombin(1:InDim,1:TrainDataNum);
TrainDataOut=InitTrainTestDataOut(1,1:TrainDataNum);
TestDataIn=SampleCombin(1:InDim,TrainDataNum+1:AllSamNum);
TestDataOut=InitTrainTestDataOut(1,TrainDataNum+1:AllSamNum);
PredictDataIn=SampleCombin(1:InDim,AllSamNum+1:end);

W1=0.5*rands(Hidden1UnitNum,InDim);          %����㵽��һ������Ȩֵ
B1=0.5*rands(Hidden1UnitNum,1);               %����㵽��һ��������ֵ
W2=0.5*rands(Hidden2UnitNum,Hidden1UnitNum); %��һ������㵽�ڶ�������Ȩֵ
B2=0.5*rands(Hidden2UnitNum,1);              %��һ������㵽�ڶ���������ֵ
W3=0.5*rands(OutDim,Hidden2UnitNum);         %�ڶ�������㵽�����Ȩֵ
B3=0.5*rands(OutDim,1);                       %�ڶ�������㵽�������ֵ

lr=0.10;                                      %ѧϰ����
Alpha=0.08;                                   %��������
MaxEpoch=40000;                             %����ѵ������
ErrCombine=0.001;                             %�ϳ�ʱѵ�����
ErrGoal=0.00005;                              %Ŀ�����
UnitsCombineThreshold=0.8;                     %�ϳ���ֵ
BiasCombineThreshold=0.01;                     %�ϳ���ֵ

%��չȨֵ����������ֵ����������Ϊ1����ֵ
W1Ex=[W1 B1];                               
W2Ex=[W2 B2];
W3Ex=[W3 B3];
%��չ����
TrainDataInEx=[TrainDataIn' ones(TrainDataNum,1)]';
ErrHistory=[];
ReSizeFlag=1;
for epoch=1:MaxEpoch
if (ReSizeFlag==1),
[Hidden2UnitNum,Hidden1UnitNum]=size(W2Ex);
Hidden1UnitNum=Hidden1UnitNum-1;
W2=W2Ex(:,1:Hidden1UnitNum);
W3=W3Ex(:,1:Hidden2UnitNum);
dW1Ex=zeros(size(W1Ex));
dW2Ex=zeros(size(W2Ex));
dW3Ex=zeros(size(W3Ex));
ReSizeFlag=0;
end

%��������������
Hidden1Out=logsig(W1Ex*TrainDataInEx);
Hidden1OutEx=[Hidden1Out' ones(TrainDataNum,1)]';
Hidden2Out=logsig(W2Ex*Hidden1OutEx);
Hidden2OutEx=[Hidden2Out' ones(TrainDataNum,1)]';
NetworkOut=logsig(W3Ex*Hidden2OutEx);
%ֹͣѧϰ�ж�
Error=TrainDataOut-NetworkOut;
SSE=sumsqr(Error)
%��¼ÿ��Ȩֵ�������ѵ�����
ErrHistory=[ErrHistory SSE];

if(SSE<ErrCombine),
%�������ڵ������׼��
Hidden1Var=var(Hidden1Out');
Hidden2Var=var(Hidden2Out');
%�������ڵ�������ϵ��
Hidden1Corr=corrcoef(Hidden1Out');
Hidden2Corr=corrcoef(Hidden2Out');
%����һ�������Ƿ���Ҫ���ڵ���кϲ�
[Hidden1unit1,Hidden1unit2]=FindUnitToCombine(Hidden1Corr,...
     Hidden1Var,UnitsCombineThreshold,BiasCombineThreshold);

if(Hidden1unit1>0),
if(Hidden1unit2>0),  %�������ڵ���кϲ�
[a,b]=LinearReg(Hidden1Out(Hidden1unit1,:),Hidden1Out(Hidden1unit2,:));
epoch
CombineType=11
DrawCorrelatedUnitsOut(Hidden1Out...
    (Hidden1unit1,:),Hidden1Out(Hidden1unit2,:));
[W1Ex,W2Ex]=CombineTwoUnits(Hidden1unit1,Hidden1unit2,a,b,W1Ex,W2Ex);
else                 %���ڵ㲢��ƫ��
epoch
CombineType=12
DrawBiasedUnitOut(Hidden1Out(Hidden1unit1,:));
UnitMean=mean(Hidden1Out(Hidden1unit1,:));
[W1Ex,W2Ex]=CombineUnitToBias(Hidden1unit1,UnitMean,W1Ex,W2Ex);
end
ReSizeFlag=1;
continue;
end

[Hidden2unit1,Hidden2unit2]=FindUnitToCombine(Hidden2Corr,Hidden2Var,...
              UnitsCombineThreshold,BiasCombineThreshold);
if(Hidden2unit1>0),
if(Hidden2unit2>0),
epoch
CombineType=21
[a,b]=LinearReg(Hidden2Out(Hidden2unit1,:),...
    Hidden2Out(Hidden2unit2,:));

DrawCorrelatedUnitsOut(Hidden2Out(Hidden2unit1,:),...
    Hidden2Out(Hidden2unit2,:));
[W2Ex,W3Ex]=CombineTwoUnits(Hidden2unit1,Hidden2unit2,a,b,W2Ex,W3Ex);
else
epoch
CombineType=22
DrawBiasedUnitOut(Hidden2Out(Hidden2unit1,:));
UnitMean=mean(Hidden2Out(Hidden2unit1,:));
[W2Ex,W3Ex]=CombineUnitToBias(Hidden2unit1,UnitMean,W2Ex,W3Ex);
end
ReSizeFlag=1;
continue;
end
end

if(SSE<ErrGoal),break,end
if(SSE<0.27),lr=0.12;end
%���㷽�򴫲����
Delta3=Error.*NetworkOut.*(1-NetworkOut);
Delta2=W3'*Delta3.*Hidden2Out.*(1-Hidden2Out);
Delta1=W2'*Delta2.*Hidden1Out.*(1-Hidden1Out);
%����ǰһʱ��Ȩֵ�������Ա���붯������
dW1Ex0=lr*dW1Ex;
dW2Ex0=lr*dW2Ex;
dW3Ex0=lr*dW3Ex;
%����Ȩֵ������
dW3Ex=Delta3*Hidden2OutEx';
dW2Ex=Delta2*Hidden1OutEx';
dW1Ex=Delta1*TrainDataInEx';
%Ȩֵ����
W1Ex=W1Ex+lr*dW1Ex+Alpha*dW1Ex0;
W2Ex=W2Ex+lr*dW2Ex+Alpha*dW2Ex0;
W3Ex=W3Ex+lr*dW3Ex+Alpha*dW3Ex0;
%����Ȩֵ�Ա����ʹ��
W2=W2Ex(:,1:Hidden1UnitNum);
W3=W3Ex(:,1:Hidden2UnitNum);

end
Hidden1UnitNum
Hidden2UnitNum
W1=W1Ex(:,1:InDim);
B1=W1Ex(:,InDim+1);
W2=W2Ex(:,1:Hidden1UnitNum);
B2=W2Ex(:,1+Hidden1UnitNum);
W3=W3Ex(:,1:Hidden2UnitNum);
B3=W3Ex(:,1+Hidden2UnitNum);
TestNNOut=BPNet(TestDataIn,W1,B1,W2,B2,W3,B3);
TestNNOut;
BinOut=TestNNOut>0.5;
ErrNum=sum(TestDataOut-BinOut);

%�������ѵ�����
TrainNNOut=BPNet(TrainDataIn,W1,B1,W2,B2,W3,B3);
TrainError=TrainDataOut-TrainNNOut;
figure;
hd1=plot(1:TrainDataNum,TrainError);
set(hd1,'color',[1 0 0],'linestyle','-',...
    'linewidth',2.2,'marker','o','markersize',6);
hold on;
hd2=plot(1:TrainDataNum,TrainDataOut);
set(hd2,'color',[0 1 0],'linestyle','-',...
    'linewidth',2.2,'marker','s','markersize',6);
hd3=plot(1:TrainDataNum,TrainNNOut);
set(hd3,'color',[0 0 1],'linestyle','-',...
    'linewidth',2.2,'marker','*','markersize',6);
grid on;axis tight;
xlabel('����ѧϰ��������');
ylabel('����ѧϰ���');
legend('ѧϰ���','����ʵ��ֵ','����ѧϰֵ');

%��������в���
figure;
grid on;
hd5=plot(1:TestDataNum,TestDataOut);
set(hd5,'color',[0 1 0],'linestyle','-',...
    'linewidth',2.2,'marker','s','markersize',6);
hold on;
hd4=plot(1:TestDataNum,TestNNOut);
set(hd4,'color',[0 0 1],'linestyle','-',...
    'linewidth',2.2,'marker','o','markersize',6);
xlabel('������������');
ylabel('����������');
axis tight;
legend('��������ʵ��ֵ','���������ֵ');

figure;
echo off;axis on;
grid on;axis tight;
[xx,Num]=size(ErrHistory);
plot(1:Num,ErrHistory,'k-');

%���������Ԥ��
PredictNNOut=BPNet(PredictDataIn,W1,B1,W2,B2,W3,B3);
PredictDataOut=((PredictNNOut-0.1)*(C-D))/0.8+D
