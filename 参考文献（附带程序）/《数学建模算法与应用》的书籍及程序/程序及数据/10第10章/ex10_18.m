clc, clear
a=load('xf.txt');   %ԭʼ�ļ������ڴ��ı��ļ�xf.txt��
T=sum(sum(a));
P=a/T;   %�����Ӧ����P
r=sum(P,2), c=sum(P)  %�����Ե�ֲ�
Row_prifile=a./repmat(sum(a,2),1,size(a,2))   %�����������ֲ���
B=(P-r*c)./sqrt((r*c));   %�����׼������B
[u,s,v]= svd(B,'econ')    %�Ա�׼�����������B������ֵ�ֽ�
w1=sign(repmat(sum(v),size(v,1),1)) %�޸����������ķ��ž���ʹ��v�е�ÿһ���������ķ����ʹ���0
w2=sign(repmat(sum(v),size(u,1),1))  %����v��Ӧ���޸�u�ķ���
vb=v.*w1  %�޸�����������������
ub=u.*w2  %�޸����������������ţ�����������������ͱ�����������
lamda=diag(s).^2   %����Z'*Z������ֵ��������������
ksi2square=T*(lamda)  %���㿨��ͳ�����ķֽ�
T_ksi2square=sum(ksi2square) %�����ܿ���ͳ����
con_rate=lamda/sum(lamda)  %���㹱����
cum_rate=cumsum(con_rate)  %�����ۻ�������
beta=diag(r.^(-1/2))*ub;  %���Ȩ��������
G=beta*s   %������������
alpha=diag(c.^(-1/2))*vb;   %���Ȩ��������
F=alpha*s   %������������F
num1=size(G,1);  %������ĸ���
rang=minmax(G(:,[1,2])');  %�����ȡֵ��Χ
delta=(rang(:,2)-rang(:,1))/(5*num1); %��ͼ�ı�עλ�õ�����
ch={'A', 'B', 'C', 'D', 'E', 'F', 'G'};
yb={'ɽ��','���ɹ�','����','����','������','����','�Ĵ�','����','����','�ຣ'};
hold on
plot(G(:,1),G(:,2),'*','Color','k','LineWidth',1.3)  %���е�ɢ��ͼ
text(G(:,1)-delta(1),G(:,2)-3*delta(2),yb) %���е���б�ע
plot(F(:,1),F(:,2),'H','Color','k','LineWidth',1.3) %���е�ɢ��ͼ
text(F(:,1)+delta(1),F(:,2),ch) %���е���б�ע
xlabel('dim1'), ylabel('dim2')
xlswrite('tt',[diag(s),lamda,ksi2square,con_rate,cum_rate])
%�Ѽ����������Excel�ļ����������ڰ�����ֱ������word�еı��
ind1=find(G(:,1)>0); %�����������һά���з���
rowclass=yb(ind1)  %�����һ��������
ind2=find(F(:,1)>0); %�����������һά���з���
colclass=ch(ind2)  %�����һ�����
