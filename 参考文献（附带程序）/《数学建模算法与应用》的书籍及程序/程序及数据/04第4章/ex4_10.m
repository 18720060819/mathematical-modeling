clc, clear
a=[1 1 1 1;1 1 1 0;1 1 0 1;1 0 1 1;1 0 1 0
   0 1 0 1;0 1 0 0;0 0 1 0;0 0 0 1; 0 0 0 0]; %ÿһ����һ������״̬
b=[1 0 0 0;1 1 0 0;1 0 1 0;1 0 0 1]; %ÿһ����һ��ת��״̬
w=zeros(10); %�ڽӾ����ʼ��
for i=1:9
    for j=i+1:10
        for k=1:4
            if findstr(mod(a(i,:)+b(k,:),2),a(j,:))
                w(i,j)=1;
            end
        end
    end
end
w=w'; %��������Ǿ���
[i,j,v]=find(w);  %�ҷ���Ԫ��
c=sparse(i,j,v,10,10) %����ϡ�����
[x,y,z]=graphshortestpath(c,1,10,'Directed',false)  % ��ͼ������ͼ
h = view(biograph(c,[],'ShowArrows','off','ShowWeights','off'));
Edges = getedgesbynodeid(h); %��ȡ���h�еı߼�
set(Edges,'LineColor',[0 0 0]); %Ϊ�˽�����ӡ������߻��ɺ�ɫ
set(Edges,'LineWidth',1.5);  %���Ϳ������Ϊ1.5