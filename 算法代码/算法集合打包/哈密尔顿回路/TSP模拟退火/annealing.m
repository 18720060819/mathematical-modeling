%function R=annealing(N,L,s,t,dt,C,R)
%N为问题规模，即节点个数；L可取较大值，如500、1000；
%s取1、2等；t为初始温度，参考范围为0.5--2；
%dt为衰减因子，一般不小于0.9;
%C为边权矩阵，应是一个强连通图的边权矩阵
%R为初始路径，结果路径也存放在R中
%L、s、t、dt应通过多次试验来确定，以获得优化的结果
%参考《非数值并行算法--模拟退火算法》科学出版社
function R=annealing(N,L,s,t,dt,C,R)
s0=0;
while 1
    a=0;
    for k=1:L
        [r,df]=calculate(R,C,N);
        if accept(t,df)
            R=r;a=1;
            disp(cost_sum(R,C,N));
        end
    end
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
