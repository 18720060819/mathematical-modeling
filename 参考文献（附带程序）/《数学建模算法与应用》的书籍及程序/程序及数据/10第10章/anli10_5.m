clc,clear
load r.txt  %ԭʼ�����ϵ�����󱣴��ڴ��ı��ļ�r.txt��
n1=5;n2=7;num=min(n1,n2);
s1=r([1:n1],[1:n1]);  %���X��X�����ϵ��
s12=r([1:n1],[n1+1:end]); %���X��Y�����ϵ��
s21=s12'; %���Y��X�����ϵ��
s2=r([n1+1:end],[n1+1:end]); %���Y��Y�����ϵ��
m1=inv(s1)*s12*inv(s2)*s21; %�������M1��ʽ��10.60��
m2=inv(s2)*s21*inv(s1)*s12; %�������M2��ʽ��10.60��
[vec1,val1]=eig(m1); %��M1����������������ֵ
for i=1:n1
    vec1(:,i)=vec1(:,i)/sqrt(vec1(:,i)'*s1*vec1(:,i)); %����������һ��������a's1a=1
    vec1(:,i)=vec1(:,i)/sign(sum(vec1(:,i))); %������������1��1����֤���з�����Ϊ��
end
val1=sqrt(diag(val1));    %��������ֵ��ƽ����
[val1,ind1]=sort(val1,'descend');  %���մӴ�С����
a=vec1(:,ind1(1:num))    %ȡ��X���ϵ����
dcoef1=val1(1:num)    %����������ϵ��
flag=1; %�Ѽ�����д��Excel�е��м�������
xlswrite('bk.xls',a,'Sheet1','A1')   %�Ѽ�����д��Excel�ļ���ȥ
flag=n1+2; str=char(['A',int2str(flag)]); %strΪExcel��д���ݵ���ʼλ��
xlswrite('bk.xls',dcoef1','Sheet1',str)
[vec2,val2]=eig(m2);  
for i=1:n2
    vec2(:,i)=vec2(:,i)/sqrt(vec2(:,i)'*s2*vec2(:,i)); %����������һ��������b's2b=1
    vec2(:,i)=vec2(:,i)/sign(sum(vec2(:,i))); %������������1��1����֤���з�����Ϊ��
end
val2=sqrt(diag(val2));    %��������ֵ��ƽ����
[val2,ind2]=sort(val2,'descend');  %���մӴ�С����
b=vec2(:,ind2(1:num))    %ȡ��Y���ϵ����
dcoef2=val2(1:num)    %����������ϵ��
flag=flag+2; str=char(['A',int2str(flag)]); %strΪExcel��д���ݵ���ʼλ��
xlswrite('bk.xls',b,'Sheet1',str)
flag=flag+n2+1; str=char(['A',int2str(flag)]); %strΪExcel��д���ݵ���ʼλ��
xlswrite('bk.xls',dcoef2','Sheet1',str)
x_u_r=s1*a     %x,u�����ϵ��
y_v_r=s2*b     %y,v�����ϵ��
x_v_r=s12*b    %x,v�����ϵ��
y_u_r=s21*a    %y,u�����ϵ��
flag=flag+2; str=char(['A',int2str(flag)]); 
xlswrite('bk.xls',x_u_r,'Sheet1',str)
flag=flag+n1+1; str=char(['A',int2str(flag)]);
xlswrite('bk.xls',y_v_r,'Sheet1',str)
flag=flag+n2+1; str=char(['A',int2str(flag)]);
xlswrite('bk.xls',x_v_r,'Sheet1',str)
flag=flag+n1+1; str=char(['A',int2str(flag)]);
xlswrite('bk.xls',y_u_r,'Sheet1',str)
mu=sum(x_u_r.^2)/n1   %x��ԭʼ������u_i���͵ķ������
mv=sum(x_v_r.^2)/n1   %x��ԭʼ������v_i���͵ķ������
nu=sum(y_u_r.^2)/n2   %y��ԭʼ������u_i���͵ķ������
nv=sum(y_v_r.^2)/n2   %y��ԭʼ������v_i���͵ķ������
fprintf('X���ԭʼ������u1~u%d���͵ı���Ϊ%f\n',num,sum(mu));
fprintf('Y���ԭʼ������v1~v%d���͵ı���Ϊ%f\n',num,sum(nv));
