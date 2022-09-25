clc, clear
format long g
a=load('dy.txt');   %ԭʼ�ļ������ڴ��ı��ļ�dy.txt��
T=sum(sum(a));
P=a/T;   %�����Ӧ����P
r=sum(P,2), c=sum(P)  %�����Ե�ֲ�
Row_prifile=a./repmat(sum(a,2),1,size(a,2))   %�����������ֲ���
B=(P-r*c)./sqrt((r*c));   %�����׼������B
[u,s,v]= svd(B,'econ')    %�Ա�׼�����������B������ֵ�ֽ�
w=sign(repmat(sum(v),size(v,1),1)) %�޸����������ķ��ž���
%ʹ��v�е�ÿһ���������ķ����ʹ���0
ub=u.*w  %�޸�����������������
vb=v.*w  %�޸�����������������
lamda=diag(s).^2   %����Z'*Z������ֵ,���������
ksi2square=T*(lamda)  %���㿨��ͳ�����ķֽ�
T_ksi2square=sum(ksi2square) %�����ܿ���ͳ����
con_rate=lamda/sum(lamda)  %���㹱����
cum_rate=cumsum(con_rate)  %�����ۻ�������
beta=diag(r.^(-1/2))*ub;  %���Ȩ��������
G=beta*s   %������������
alpha=diag(c.^(-1/2))*vb;   %���Ȩ��������
F=alpha*s   %������������F
num=size(G,1);  
rang=minmax(G(:,1)');  %�����ȡֵ��Χ
delta=(rang(2)-rang(1))/(8*num); %��ͼ�ı�עλ�õ�����
ch='LPSBEM';
hold on
for i=1:num
plot(G(i,1),G(i,2),'*','Color','k','LineWidth',1.3)  %���е�ɢ��ͼ
text(G(i,1)+delta,G(i,2),ch(i)) %���е���б�ע
plot(F(i,1),F(i,2),'H','Color','k','LineWidth',1.3) %���е�ɢ��ͼ
text(F(i,1)+delta,F(i,2),int2str(i+1972)) %���е���б�ע
end
xlabel('dim1'), ylabel('dim2')
xlswrite('tt1',[diag(s),lamda,ksi2square,con_rate,cum_rate])
%�Ѽ����������Excel�ļ����������ڰ�����ֱ������word�еı��
format
