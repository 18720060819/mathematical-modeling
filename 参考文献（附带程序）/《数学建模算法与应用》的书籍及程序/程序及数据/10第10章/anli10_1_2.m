clc,clear
load gj.txt   %��ԭʼ���ݱ����ڴ��ı��ļ�gj.txt��
gj(:,[3:6])=[]; %ɾ�����ݾ���ĵ�3�С���6��,��ʹ�ñ���1,2,7,8,9,10
gj=zscore(gj); %���ݱ�׼��
y=pdist(gj); %�������ŷ�Ͼ���,ÿ����һ������
z=linkage(y,'average');  %����ƽ��������
h=dendrogram(z);  %������ͼ
set(h,'Color','k','LineWidth',1.3)  %�Ѿ���ͼ�ߵ���ɫ�ĳɺ�ɫ���߿�Ӵ�
for k=3:5
    fprintf('���ֳ�%d��Ľ�����£�\n',k)
    T=cluster(z,'maxclust',k);  %�������㻮�ֳ�k��
    for i=1:k
      tm=find(T==i);  %���i��Ķ���
      tm=reshape(tm,1,length(tm)); %���������
      fprintf('��%d�����%s\n',i,int2str(tm)); %��ʾ������
    end
    if k==5
        break
    end
    fprintf('**********************************\n');
end
