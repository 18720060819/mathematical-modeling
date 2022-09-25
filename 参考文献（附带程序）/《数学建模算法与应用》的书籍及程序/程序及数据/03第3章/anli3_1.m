clc,clear
x0=[150 85 150 145 130 0];
y0=[140 85 155 50 150 0];
q=[243 236 220.5 159 230 52];
xy0=[x0; y0];
d0=dist(xy0);   %��������������֮��ľ���
d0(find(d0==0))=inf;
a0=asind(8./d0)  %�Զ�Ϊ��λ�ķ�����
xy1=x0+i*y0
xy2=exp(i*q*pi/180)
for m=1:6
     for n=1:6
         if n~=m
         b0(m,n)=angle((xy2(n)-xy2(m))/(xy1(m)-xy1(n))); 
         end
     end
end
b0=b0*180/pi;
dlmwrite('txt1.txt',a0,'delimiter', '\t','newline','PC');
dlmwrite('txt1.txt','~','-append');       %�����ı��ļ���дLINGO���ݵķָ��
dlmwrite('txt1.txt',b0,'delimiter', '\t','newline','PC','-append','roffset', 1)
