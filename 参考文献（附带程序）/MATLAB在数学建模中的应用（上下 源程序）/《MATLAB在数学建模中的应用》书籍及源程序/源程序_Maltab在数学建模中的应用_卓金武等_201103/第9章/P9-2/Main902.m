clc;close all;clear all;
disp('����������Ҫ�����ӵ�����ʱ�䣬��ȴ�����');
p=zeros(10,100);avert=zeros(10,100);
%�ֱ��ڹ˿�����Ϊ10��100��500�����ʱ��ģ��ϵͳ����ǿ�Ⱥ͹˿�ƽ������ʱ��
nn=[10 100 500 1000 5000 10000 20000 50000 100000 500000];
for d=1:10 %length(nn)=10
    for s=1:100 %ÿ������ظ�ģ��100���Ա������������
        n=nn(d);%ģ��˿���Ŀ
        dt=exprnd(10,1,n);%����ʱ����
        st=normrnd(6.5,1.2,1,n);%����̨����ʱ��
        a=zeros(1,n);%ÿ���˿͵���ʱ��
        b=zeros(1,n);%ÿ���˿Ϳ�ʼ���ܷ���ʱ��
        c=zeros(1,n);%ÿ���˿��뿪ʱ��
        a(1)=0;
            for i=2:n
            a(i)=a(i-1)+dt(i-1);%��i�˿͵���ʱ��
            end
        b(1)=0;%��һ���˿Ϳ�ʼ���ܷ����ʱ�����䵽���ʱ��
        c(1)=b(1)+st(1);%��һ���˿͵��뿪ʱ��Ϊ����ܵķ���ʱ����Ͽ�ʼ���ܷ����ʱ��
           for i=2:n
%�����i���˿͵���ʱ���ǰһ���˿��뿪ʱ���磬����ܷ���ʱ��Ϊǰһ���뿪ʱ��
               if(a(i)<=c(i-1))b(i)=c(i-1);
%�����i���˿͵���ʱ���ǰһ���˿��뿪ʱ��������ܷ���ʱ��Ϊ�䵽��ʱ��
               else b(i)=a(i);
               end
%��i���˿��뿪ʱ��Ϊ�俪ʼ���ܷ����ʱ��+���ܷ����ʱ�䳤��
        c(i)=b(i)+st(i);
           end
        cost=zeros(1,n);%��¼ÿ���˿���ϵͳ����ʱ��
        for i=1:n
            cost(i)=c(i)-a(i);%��i���˿���ϵͳ����ʱ��
        end
        T=c(n);%��ʱ��
        p(d,s)=sum(st)/T;
        avert(d,s)=sum(cost)/n;
    end
end
pc=sum(p')/100;avertc=sum(avert')/100;
figure(1);subplot(2,1,1);%������ͼ
plot(pc,'color','g','linestyle','-','linewidth',2.5,'marker','*','markersize',5);
text(1,pc(:,1),texlabel('10��'),'fontsize',11);
text(2,pc(:,2),texlabel('10^2 ��'),'fontsize',11);
text(3-0.15,pc(:,3)-0.004,texlabel('5x10^2 ��'),'fontsize',11);
text(4-0.15,pc(:,4)-0.004,texlabel('10^3 ��'),'fontsize',11);
text(5-0.15,pc(:,5)-0.004,texlabel('5x10^3 ��'),'fontsize',11);
text(6-0.15,pc(:,6)-0.004,texlabel('10^4 ��'),'fontsize',11);
text(7-0.15,pc(:,7)-0.004,texlabel('2x10^4 ��'),'fontsize',11);
text(8-0.15,pc(:,8)-0.004,texlabel('5x10^4 ��'),'fontsize',11);
text(9-0.15,pc(:,9)-0.004,texlabel('10^5 ��'),'fontsize',11);
text(10-0.15,pc(:,10)-0.004,texlabel('5x10^5 ��'),'fontsize',11);
xlim([1 11]);xlabel('�˿�����/��','fontsize',11);ylabel('ϵͳ����ǿ��','fontsize',11);
subplot(2,1,2);
plot(avertc,'color','r','linestyle','-','linewidth',2.5,'marker','s','markersize',5);
text(1,avertc(:,1)+0.4,texlabel('10��'),'fontsize',11);
text(2-0.15,avertc(:,2)-0.4,texlabel('10^2 ��'),'fontsize',11);
text(3-0.15,avertc(:,3)-0.4,texlabel('5x10^2 ��'),'fontsize',11);
text(4-0.15,avertc(:,4)-0.4,texlabel('10^3 ��'),'fontsize',11);
text(5-0.15,avertc(:,5)-0.4,texlabel('5x10^3 ��'),'fontsize',11);
text(6-0.15,avertc(:,6)-0.4,texlabel('10^4 ��'),'fontsize',11);
text(7-0.15,avertc(:,7)-0.4,texlabel('2x10^4 ��'),'fontsize',11);
text(8-0.15,avertc(:,8)-0.4,texlabel('5x10^4 ��'),'fontsize',11);
text(9-0.15,avertc(:,9)-0.4,texlabel('10^5 ��'),'fontsize',11);
text(10-0.15,avertc(:,10)-0.4,texlabel('5x10^5 ��'),'fontsize',11);
xlim([1 11]);xlabel('�˿�����/��','fontsize',11);ylabel('�˿Ͷ���ʱ��/��','fontsize',11);
