clc,clear
syms m V rho g k
s=dsolve('m*D2s-m*g+rho*g*V+k*Ds','s(0)=0,Ds(0)=0');
s=subs(s,{m,V,rho,g,k},{239.46,0.2058,1035.71,9.8,0.6});
s=vpa(s,10)  %��λ�ƺ���
v=dsolve('m*Dv-m*g+rho*g*V+k*v','v(0)=0');
v=subs(v,{m,V,rho,g,k},{239.46,0.2058,1035.71,9.8,0.6});
v=vpa(v,7)  %���ٶȺ���
y=s-90; 
tt=solve(y)   %�󵽴ﺣ��90�״���ʱ��
vv=subs(v,tt)  %�󵽵׺���90�״����ٶ�
