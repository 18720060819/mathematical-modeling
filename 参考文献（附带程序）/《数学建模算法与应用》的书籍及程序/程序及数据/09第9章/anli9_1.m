%ԭʼ����cancerdata.txt�����������أ������е�B�滻��1��M�滻��-1��X�滻��2��ɾ���˷ָ��*,�滻�������������cancerdata2.txt
clc,clear
a=load('cancerdata2.txt');
a(:,1)=[];  %ɾ����һ�в�����
gind=find(a(:,1)==1);  %�����������������
bind=find(a(:,1)==-1); %�����������������
training0=a([1:500],[2:end]); %�����֪�����������
training=training0'; 
[train,ps]=mapstd(training); %�ѷ������ݱ�׼��
group(gind)=1; group(bind)=-1;  %��֪������������
group=group'; %ת����������
xa0=a([501:569],[2:end]); %�������������
xa=xa0'; xa=mapstd('apply',xa,ps); %���������ݱ�׼��
s=svmtrain(training',group, 'Method','SMO', 'Kernel_Function','quadratic') %ʹ��������С������ѵ��֧���������ķ����������ʹ�ö��ι滮�ķ���ѵ��֧�����������޷����
sv_index=s.SupportVectorIndices'  %����֧�������ı��
beta=s.Alpha'  %���ط��ຯ����Ȩϵ��
b=s.Bias  %���ط��ຯ���ĳ�����
mean_and_std_trans=s.ScaleData %��1�з��ص�����֪�������ֵ�������෴������2�з��ص��Ǳ�׼�������ĵ���
check=svmclassify(s,training');  %��֤��֪������
err_rate=1-sum(group==check)/length(group) %���������
solution=svmclassify(s,xa'); %���д������������
solution=solution' 
sg=find(solution==1)  %������������е����Ա��
sb=find(solution==-1) %������������еĶ��Ա��
