%首先输入关联矩阵F及节点个数n
F=[0 1 0 0 0 0 0;
    1 0 1 0 0 0 0;
    0 1 0 1 1 1 0;
    0 0 1 0 0 1 0;
    0 0 1 0 0 1 0;
    0 0 1 1 1 0 1;
    0 0 0 0 0 1 0];
n=7;
C=[];
l=0;
for i=1:n
    for j=1:n
        if F(i,j)~=0
            if l==0
                C=[i j];l=2;
            else 
                p=0;q=0;
                for a=1:l
                    if C(a)==i
                        p=1;
                    end
                    if C(a)==j
                        q=1;
                    end
                end
                if p==0
                    l=l+1;C(l)=i;
                end 
                if q==0
                    l=l+1;C(l)=j;
                end 
                F(i,:)=zeros(1,n);
                F(:,j)=zeros(n,1);
            end
        end
    end
end
disp(C);
    