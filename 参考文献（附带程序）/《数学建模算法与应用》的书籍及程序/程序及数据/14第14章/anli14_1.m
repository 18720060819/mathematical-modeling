clc, clear
a=load('zhaopin.txt');   %��ԭʼ���ݱ����ڴ��ı��ļ�zhaopin.txt�У����Ұ�A��B��C��D�ֱ��滻����Ӧ����ֵ
b=zscore(a); %���ݱ�׼��
w=[0.4211    0.1053    0.2105    0.0526    0.2105];
w=repmat(w,16,1);
c=b.*w    %�����Ȩ����
cstar=max(c)    %���������
c0=min(c)       %�������
for i=1:16
    sstar(i)=norm(c(i,:)-cstar);   %���������ľ���
    s0(i)=norm(c(i,:)-c0);       %�󵽸�����ľ���
end
f=s0./(sstar+s0);
xlswrite('book3.xls',[sstar' s0' f'])  %�Ѽ�����д��Excel�ļ��У����ڽ�������
[sc,ind]=sort(f,'descend')       %��������
