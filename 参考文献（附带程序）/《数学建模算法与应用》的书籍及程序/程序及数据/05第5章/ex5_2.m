clc, clear
x0=0.15:0.01:0.18;
y0=[3.5	1.5	2.5	2.8];
pp=csape(x0,y0)   %Ĭ�ϵı߽�������Lagrange�߽�����
format long g
xishu=pp.coefs   %��ʾÿ�����������ζ���ʽ��ϵ��
s=quadl(@(t)ppval(pp,t),0.15,0.18)  %�����
format  %�ָ���С������ʾ��ʽ
