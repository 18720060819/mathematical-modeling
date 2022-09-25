function [u,i,j,df]=GCPgen(e,d,b,n,w,lamda)
u=1+fix(unifrnd(0,n));i=e(u);
while 1
    j=1+fix(unifrnd(0,d+1));
    if j~=i
        break;
    end
end

df=0;
for v=1:n
    if e(v)==j
        df=df+b(v,u)*w(j);
    end
    if e(v)==i
        df=df-b(v,u)*w(i);
    end
end
df=w(j)-w(i)-lamda*df;
