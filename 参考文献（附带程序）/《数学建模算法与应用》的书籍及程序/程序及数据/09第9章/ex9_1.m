clc, clear
a0=load('fenlei.txt'); %�ѱ���x1...x8���������ݱ����ڴ��ı��ļ�fenlei.txt��
a=a0'; b0=a(:,[1:27]); dd0=a(:,[28:end]); %��ȡ�ѷ���ʹ����������
[b,ps]=mapstd(b0); %�ѷ������ݵı�׼��
dd=mapstd('apply',dd0,ps); %���������ݵı�׼��
group=[ones(20,1); 2*ones(7,1)]; %��֪������������
s=svmtrain(b',group) %ѵ��֧��������������
sv_index=s.SupportVectorIndices  %����֧�������ı��
beta=s.Alpha  %���ط��ຯ����Ȩϵ��
bb=s.Bias  %���ط��ຯ���ĳ�����
mean_and_std_trans=s.ScaleData %��1�з��ص�����֪�������ֵ�������෴������2�з��ص��Ǳ�׼�������ĵ���
check=svmclassify(s,b')  %��֤��֪������
err_rate=1-sum(group==check)/length(group) %������֪������Ĵ�����
solution=svmclassify(s,dd') %�Դ�����������з���
