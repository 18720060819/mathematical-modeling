clc, clear
format long g
a=load('jijie.txt');
[m,n]=size(a);
a_mean=mean(mean(a));  %�����������ݵ�����ƽ��ֵ
aj_mean=mean(a);  %����ͬ���ڵ�����ƽ��ֵ
bj=aj_mean/a_mean  %���㼾��ϵ��
w=1:m;
yhat=w*sum(a,2)/sum(w)  %Ԥ����һ������Ȩƽ��ֵ,���������к�
yjmean=yhat/n  %����Ԥ����ݵļ���ƽ��ֵ
yjhat=yjmean*bj  %Ԥ����ݵļ���Ԥ��ֵ
format   %�ָ�Ĭ�ϵ���ʾ��ʽ
