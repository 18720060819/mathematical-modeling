z=[16 12 15 10 9 17 11 16 10 14]; %�θ�һ�����ݣ�ͨ�����溯�����������ֵz1��������Э�����r����������غ���p��SACF��������ƫ����غ���q(SPACF)

N=size(z);   %size(A,1)���ؾ���A������  size(A,2)���ؾ���A������
n=N(1,2);
z1=sum(z)/n; %������ֵz1

s0=0;
for i=1:n
    s0=(z(i)-z1)^2+s0;
end
r0=s0/n;

%%������Э�����r
for k=1:(n-1)
    nr(k)=0;
    for t=1:(n-k)
        nr(k)=(z(t)-z1)*(z(t+k)-z1)+nr(k);
    end 
end   
r=nr./n;

%%��������غ���p
p=(r./r0)';%p=vpa((r./r0)',3); %vpa(n,m)��n����С�����mλ

%%ƫ����غ���q
for m=1:(n-2)
    q(1,1)=p(1);
    D=0;T=0;
    for h=1:m
        D=p(m+1-h)*q(m,h)+D;
        T=p(h)*q(m,h)+T;
    end
        q(m+1,m+1)=(p(m+1)-D)/(1-T);
    for j=1:m
        q(m+1,j)=q(m,j)-q(m+1,m+1)*q(m,m+1-j);
    end     
end
q
