clc,clear
a=textread('hua.txt');  %��ԭʼ���ݰ���ԭ�������и�ʽ����ڴ��ı��ļ�hua.txt
a=nonzeros(a')'; %����ԭ�����ݵ�˳��ȥ����Ԫ��
da=diff(a);      %����1�ײ��
spec3= garchset('R',0,'M',1,'Display','off'); %ָ��ģ�͵Ľṹ
[coeffX,errorsX,LLFX] = garchfit(spec3,da)    %��ϲ���,da����������
[sigmaForecast,w_Forecast] = garchpred(coeffX,da,10)  %����10��Ԥ��ֵ
x_pred=a(end)+cumsum(w_Forecast)   %����ԭʼ���ݵ�10��Ԥ��ֵ
