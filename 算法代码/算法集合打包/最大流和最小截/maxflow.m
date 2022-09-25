%function [f,s]=maxflow(startp,endp,c)
%c为容量网络
%对容量网络的填写做一下说明
%容量具有方向性，比如弧(i,j)的容量为10，弧(j,i)为0
%即矩阵无须有对称性
function [f,s]=maxflow(startp,endp,c)
n=length(c);
f=zeros(size(c));
l=zeros(1,n);d=zeros(1,n);examine=zeros(1,n);
l(startp)=0.5;d(startp)=inf;
while 1
    ifexam=0;ifl=0;
    for i=1:n
        if l(i)~=0
            ifl=ifl+1;
            if examine(i)==1
                ifexam=ifexam+1;
            end
        end
    end
    if ifl==ifexam
        break;
    end
    for i=1:n
        if l(i)~=0&examine(i)==0
            break;
        end
    end
    for j=1:n
        if c(i,j)~=0
            if f(i,j)<c(i,j)&l(j)==0
                l(j)=i;
                d(j)=min(d(i),c(i,j)-f(i,j));
            end
        end
        if c(j,i)~=0
            if f(j,i)>0&l(j)==0
                
                l(j)=-i;
                d(j)=min(d(i),f(i,j));
            end
        end
    end
    examine(i)=1;
    if l(endp)~=0
        j=endp;
        while 1
            if l(j)~=0.5
                if l(j)>0
                    i=l(j);
                    f(i,j)=f(i,j)+d(endp);
                    j=i;
                end
                if l(j)<0
                    i=-l(j);
                    f(j,i)=f(j,i)-d(endp);
                    j=i;
                end
            else
                l=zeros(1,n);break;
            end
        end
        l(startp)=0.5;d(startp)=inf;examine=zeros(1,n);
    end
end
s=[];ns=0;
for i=1:n
    if l(i)~=0
        ns=ns+1;
        s(ns)=i;
    end
end
fprintf('f为最大可行流\n');
fprintf('图的最小截划分得到的一个子集s为：\n');
disp(s);

    