clc,clear
a=[1,0;1,1;3,2;4,3;2,5];
y=pdist(a,'cityblock');  %��a��������������ľ���ֵ����
yc=squareform(y)  %�任�ɾ��뷽��
z=linkage(y)  %�����ȼ�������
[h,t]=dendrogram(z) %������ͼ
T=cluster(z,'maxclust',3)  %�Ѷ��󻮷ֳ�3��
for i=1:3
    tm=find(T==i);  %���i��Ķ���
    tm=reshape(tm,1,length(tm)); %���������
    fprintf('��%d�����%s\n',i,int2str(tm)); %��ʾ������
end
