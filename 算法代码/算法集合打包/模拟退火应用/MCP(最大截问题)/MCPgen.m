function [u,df]=MCPgen(e,N,w)
u=1+fix(unifrnd(0,N));
df=0;
for v=1:N
    if e(v)==e(u)
        df=df+w(v,u);
    else
        df=df-w(v,u);
    end
end
