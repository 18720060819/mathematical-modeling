clc,clear
load data3.txt  %�ѱ�5.8�е����ں�ʱ��������ɾ�������µ����ݱ����ڴ��ı��ļ�
liu=data3([1,3],:); liu=liu'; liu=liu(:);  %���ˮ����������˳����������
sha=data3([2,4],:); sha=sha'; sha=sha(:); %�����ɳ��������˳����������
y=sha.*liu; y=y';  %������ɳ���������������
i=1:24;
t=(12*i-4)*3600;
t1=t(1);t2=t(end);
pp=spapi(4,t,y)      %����B����
pp2=fn2fm(pp,'pp')  %��B��������ת��Ϊpp��ʽ
TL=quadl(@(tt)fnval(pp,tt),t1,t2)
