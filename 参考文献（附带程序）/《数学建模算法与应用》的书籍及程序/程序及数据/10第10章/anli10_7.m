clc,clear
a=[543	342	453	609	261	360	243	183
245	785	630	597	311	233	108	69
300	200	489	740	365	324	327	228
401	396	395	693	350	309	263	143
147	117	410	726	366	447	329	420];
a_i_dot=sum(a,2)   %�����к�
a_dot_j=sum(a)  %�����к�
T=sum(a_i_dot)  %�������ݵ��ܺ�
P=a/T;   %�����Ӧ����P
r=sum(P,2), c=sum(P)  %�����Ե�ֲ�
Row_prifile=a./repmat(sum(a,2),1,size(a,2))   %�����������ֲ���
B=(P-r*c)./sqrt((r*c));   %�����׼������B
[u,s,v]=svd(B,'econ')  %�Ա�׼�����������B������ֵ�ֽ�
w1=sign(repmat(sum(v),size(v,1),1)) %�޸����������ķ��ž���
%ʹ��v�е�ÿһ���������ķ����ʹ���0
w2=sign(repmat(sum(v),size(u,1),1));  %����v��Ӧ���޸�u�ķ���
vb=v.*w1;  %�޸�����������������
ub=u.*w2;  %�޸�����������������
lamda=diag(s).^2   %����Z'*Z������ֵ,�ȼ������
ksi2square=T*(lamda)  %���㿨��ͳ�����ķֽ�
T_ksi2square=sum(ksi2square) %�����ܿ���ͳ����
con_rate=lamda/sum(lamda)  %���㹱����
cum_rate=cumsum(con_rate)  %�����ۻ�������
beta=diag(r.^(-1/2))*ub;   %���Ȩ��������
G=beta*s   %������������G
alpha=diag(c.^(-1/2))*vb;  %���Ȩ��������
F=alpha*s   %������������F
num1=size(G,1);  %������ĸ���
rang=minmax(G(:,[1 2])');  %�������ȡֵ��Χ
delta=(rang(:,2)-rang(:,1))/(4*num1); %��ͼ�ı�עλ�õ�����
chrow={'A', 'B', 'C', 'D', 'E'};
strcol={'����','��Ů','����','����','ũ��','ʿ��','����','����'};
hold on
plot(G(:,1),G(:,2),'*','Color','k','LineWidth',1.3)  %���е�ɢ��ͼ
text(G(:,1),G(:,2)-delta(2),chrow) %���е���б�ע
plot(F(:,1),F(:,2),'H','Color','k','LineWidth',1.3) %���е�ɢ��ͼ
text(F(:,1)-delta(1),F(:,2)+1.2*delta(2),strcol) %���е���б�ע
xlabel('dim1'), ylabel('dim2')
xlswrite('tt',[diag(s),lamda,ksi2square,con_rate,cum_rate])
%�Ѽ����������Excel�ļ����������ڰ�����ֱ������word�еı��
dd=dist(G(:,1:2),F(:,1:2)') %�����һ���������������ڶ��������������֮��ľ���
