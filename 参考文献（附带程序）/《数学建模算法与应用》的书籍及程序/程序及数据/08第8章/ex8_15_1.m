clc,clear
a=textread('hua.txt');  %��ԭʼ���ݰ���ԭ�������и�ʽ����ڴ��ı��ļ�hua.txt
a=nonzeros(a')'; %����ԭ�����ݵ�˳��ȥ����Ԫ��
r11=autocorr(a)   %��������غ���
r12=parcorr(a)   %����ƫ��غ���
da=diff(a);      %����1�ײ��
r21=autocorr(da)  %��������غ���
r22=parcorr(da)   %����ƫ��غ���
n=length(da);  %�����ֺ�����ݸ���
for i=0:3
    for j=0:3
    spec= garchset('R',i,'M',j,'Display','off'); %ָ��ģ�͵Ľṹ
    [coeffX,errorsX,LLFX] = garchfit(spec,da);  %��ϲ���
    num=garchcount(coeffX);   %������ϲ����ĸ���
    %compute Akaike and Bayesian Information Criteria
    [aic,bic]=aicbic(LLFX,num,n); 
    fprintf('R=%d,M=%d,AIC=%f,BIC=%f\n',i,j,aic,bic);  %��ʾ������
    end
end
r=input('�������R��');m=input('�������M��');
spec2= garchset('R',r,'M',m,'Display','off'); %ָ��ģ�͵Ľṹ
[coeffX,errorsX,LLFX] = garchfit(spec2,da)    %��ϲ���
[sigmaForecast,w_Forecast] = garchpred(coeffX,da,10)  %����10��Ԥ��ֵ
x_pred=a(end)+cumsum(w_Forecast)   %����ԭʼ���ݵ�10��Ԥ��ֵ
