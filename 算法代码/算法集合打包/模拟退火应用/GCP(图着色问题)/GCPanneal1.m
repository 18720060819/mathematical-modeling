%function [e,c]=GCPanneal1(L,s,t,dt,lamda,d,b,n)
%
%图着色问题(Graph Colouring Problem)的退火算法
%GCP问题可看为将顶点集划分为最少个数独立集的问题
%
%求解此问题有两种算法，
%GCPanneal1适用于度数小于20的情形
%GCPanneal2适用于各种度数
%在GCPanneal1中，w(i)表示赋予颜色i的权值
%
%n为问题规模，即节点个数；b为关联矩阵
%lamda是一个大于1的罚函数因子
%d为图G的最大度数，最小着色上界为d+1
%e(u)表示u被着的颜色号
%c(i)表示着以颜色i的顶点个数
%
%L可取较大值，如500、1000；
%s取1、2等；t为初始温度，参考范围为0.5--2；
%dt为衰减因子，一般不小于0.9;
%L、s、t、dt应通过多次试验来确定，以获得优化的结果
%参考《非数值并行算法--模拟退火算法》科学出版社

function [e,c]=GCPanneal1(L,s,t,dt,lamda,d,b,n)
w(1)=2^d;
for j=2:(d+1)
    w(j)=2*w(j-1)-w(1)-1;
end
%赋权

e=zeros(1,n);
e=e+1;
c=zeros(1,d+1);
c(1)=n;
%设定初始解

s0=0;
while 1
    a=0;
    for k=1:L
        [u,i,j,df]=GCPgen1(e,d,b,n,w,lamda);
        if GCPacc1(df,t)
              e(u)=j;c(i)=c(i)-1;c(j)=c(j)+1;
              a=1;
        end
    end
    fprintf('图中各点被着的颜色号\n');
    disp(e);
    fprintf('着以各颜色的顶点个数\n');
    disp(c);
    t=t*dt
    if a==0
        s0=s0+1;
    else 
        s0=0;
    end
    if s0==s
        break;
    end
end




