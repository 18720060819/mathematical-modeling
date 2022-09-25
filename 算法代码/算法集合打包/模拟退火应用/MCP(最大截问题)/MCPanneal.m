%function [e,f]=MCPanneal(L,s,t,dt,w,N)
%最大截问题(Max Cut Problem)的退火算法
%由于算法的缺陷，当f值在较长时间内不再改变时，可用cl+c停止程序
%N为问题规模，即节点个数；w为权矩阵
%L可取较大值，如500、1000；
%s取1、2等；t为初始温度，参考范围为0.5--2；
%dt为衰减因子，一般不小于0.9;
%e为以0、1为元素的数组，来表示两个子集
%f为最大截权重和
%L、s、t、dt应通过多次试验来确定，以获得优化的结果
%参考《非数值并行算法--模拟退火算法》科学出版社

function [e,f]=MCPanneal(L,s,t,dt,w,N)
f=0;
e=zeros(1,N);

s0=0;
while 1
    a=0;
    for k=1:L
        [u,df]=MCPgen(e,N,w);
        if MCPacc(df,t)
              e(u)=1-e(u);
              f=f+df;
              a=1;
        end
    end
    disp(e);disp(f);
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