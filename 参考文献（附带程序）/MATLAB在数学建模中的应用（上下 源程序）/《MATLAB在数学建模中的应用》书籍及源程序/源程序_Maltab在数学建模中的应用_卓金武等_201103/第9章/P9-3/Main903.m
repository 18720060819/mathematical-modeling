%�����򻭳�����������Ƕ��1/4Բ�����ͼ��
%������С�������̺����ýṹ������ͼ�����Ժ�ͼ�ζ������������Եײ�����
clc;
x=0:0.01:1;
y=sqrt(1-x.^2);
figure;
h=plot(x,y);
active.linestyle='-';
active.linewidth=3;
active.color='k';
set(h,active);
set(gcf,'color','y');
set(gca,'color','b');
xlabel('x');
ylabel('y');
grid on;
axis square;
