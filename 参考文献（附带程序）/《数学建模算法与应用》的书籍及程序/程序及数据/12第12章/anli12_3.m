tic  %��ʱ��ʼ
clc,clear
sj0=load('sj.txt');       %����100��Ŀ�������
x=sj0(:,1:2:8); x=x(:);
y=sj0(:,2:2:8); y=y(:);
sj=[x y]; d1=[70,40]; 
sj=[d1;sj;d1]; sj=sj*pi/180;  %��λ���ɻ���
d=zeros(102); %�������d�ĳ�ʼֵ
for i=1:101
  for j=i+1:102
  d(i,j)=6370*acos(cos(sj(i,1)-sj(j,1))*cos(sj(i,2))*cos(sj(j,2))+sin(sj(i,2))*sin(sj(j,2)));
  end
end
d=d+d'; w=50; g=100; %wΪ��Ⱥ�ĸ�����gΪ�����Ĵ���
rand('state',sum(clock)); %��ʼ�������������
for k=1:w  %ͨ������Ȧ�㷨ѡȡ��ʼ��Ⱥ
    c=randperm(100); %����1��...��100��һ��ȫ����  
    c1=[1,c+1,102]; %���ɳ�ʼ��
    for t=1:102 %�ò�ѭ�����޸�Ȧ 
        flag=0; %�޸�Ȧ�˳���־
    for m=1:100
      for n=m+2:101
        if d(c1(m),c1(n))+d(c1(m+1),c1(n+1))<d(c1(m),c1(m+1))+d(c1(n),c1(n+1))
           c1(m+1:n)=c1(n:-1:m+1);  flag=1; %�޸�Ȧ
        end
      end
    end
   if flag==0
      J(k,c1)=1:102; break %��¼�½ϺõĽⲢ�˳���ǰ��ѭ��
   end
   end
end
J(:,1)=0; J=J/102; %����������ת����[0,1]�����ϵ�ʵ������ת����Ⱦɫ�����
for k=1:g  %�ò�ѭ�������Ŵ��㷨�Ĳ��� 
    A=J; %��������Ӵ�B�ĳ�ʼȾɫ��
    for i=1:2:w
        ch1(1)=rand; %�������еĳ�ʼֵ
        for j=2:50
            ch1(j)=4*ch1(j-1)*(1-ch1(j-1)); %������������
        end
        ch1=2+floor(100*ch1); %������������ĵ�ַ
        temp=A(i,ch1); %�м�����ı���ֵ
        A(i,ch1)=A(i+1,ch1); %�������
        A(i+1,ch1)=temp;
    end
    by=[];  %Ϊ�˷�ֹ��������յ�ַ�������ȳ�ʼ��
while ~length(by)
    by=find(rand(1,w)<0.1); %������������ĵ�ַ
end
num1=length(by); B=J(by,:); %������������ĳ�ʼȾɫ��
ch2=rand;  %�����������еĳ�ʼֵ
for t=2:2*num1 
       ch2(t)=4*ch2(t-1)*(1-ch2(t-1)); %������������
end
for j=1:num1
   bw=sort(2+floor(100*rand(1,2)));  %�������������2����ַ
   B(j,bw)=ch2([j,j+1]); %bw���������������˱���
end
   G=[J;A;B]; %�������Ӵ���Ⱥ����һ��
   [SG,ind1]=sort(G,2); %��Ⱦɫ�巭���1��...,102������ind1
   num2=size(G,1); long=zeros(1,num2); %·�����ȵĳ�ʼֵ
   for j=1:num2
       for i=1:101
           long(j)=long(j)+d(ind1(j,i),ind1(j,i+1)); %����ÿ��·������
       end
   end
     [slong,ind2]=sort(long); %��·�����Ȱ��մ�С��������
     J=G(ind2(1:w),:); %��ѡǰw���϶̵�·����Ӧ��Ⱦɫ��
end
path=ind1(ind2(1),:), flong=slong(1)  %���·����·������
toc  %��ʱ����
xx=sj(path,1);yy=sj(path,2);
plot(xx,yy,'-o') %����·��
