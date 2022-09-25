function [u,df]=ISPgen(e,N,w,lamda)
u=1+fix(unifrnd(0,N));
df=0;
for v=1:N
    if e(v)==1
        df=df+w(v,u);
    end
end
df=1-lamda*df;
if e(u)==1
    df=-df;
end
