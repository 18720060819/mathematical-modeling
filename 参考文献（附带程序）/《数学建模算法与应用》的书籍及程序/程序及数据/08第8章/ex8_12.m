clc,clear
spec=garchset('C',0,'AR',0.8,'MA',0.4,'K',0.01,'GARCH',0.2,'ARCH',0.3) %ָ��ģ�͵Ľṹ
y=garchsim(spec,10000); %����ָ���ṹģ�͵�10000��ģ������
[Coeff,Errors,LLF,Innovations,Sigmas,Summary]=garchfit(spec,y)  %ģ�����
h=lbqtest(Innovations)  %����chi2����
[SigmaForecast,MeanForecast]=garchpred(Coeff,y,3)  %Ԥ��δ����3��ֵ
