%function [e,f]=ISPanneal(L,s,t,dt,lamda,w,N)
%
%独立集问题(Independent Set Problem)的退火算法
%设有图G=(V,E),要找V的最大独立集，即找最大的V'属于V,
%满足其中的任意两点都不关联
%
%N为问题规模，即节点个数；w为权矩阵
%e为以0、1为元素的数组，来表示两个子集
%lamda是一个大于1的罚函数因子
%
%L可取较大值，如500、1000；
%s取1、2等；t为初始温度，参考范围为0.5--2；
%dt为衰减因子，一般不小于0.9;
%L、s、t、dt应通过多次试验来确定，以获得优化的结果
%参考《非数值并行算法--模拟退火算法》科学出版社

function [e,f]=ISPanneal(L,s,t,dt,lamda,w,N)
f=0;
e=zeros(1,N);

s0=0;
while 1
    a=0;
    for k=1:L
        [u,df]=ISPgen(e,N,w,lamda);
        if ISPacc(df,t)
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