clc, clear
load gj.txt   %��ԭʼ���ݱ����ڴ��ı��ļ�gj.txt��
d=pdist(gj','correlation'); %�������ϵ�������ľ���
z=linkage(d,'average');  %����ƽ��������
h=dendrogram(z);  %������ͼ
set(h,'Color','k','LineWidth',1.3)  %�Ѿ���ͼ�ߵ���ɫ�ĳɺ�ɫ���߿�Ӵ�
T=cluster(z,'maxclust',6)  %�ѱ������ֳ�6��
for i=1:6
    tm=find(T==i);  %���i��Ķ���
    tm=reshape(tm,1,length(tm)); %���������
    fprintf('��%d�����%s\n',i,int2str(tm)); %��ʾ������
end
