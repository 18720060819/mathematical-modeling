clc
clear 
A=[1 5 3 7;1/5 1 1/3 3;1/3 3 1 5;1/7 1/3 1/5 1];
[m,n]=size(A);
RI=[0 0 0.58 0.90 1.12 1.24 1.32 1.41 1.45 1.49 1.51];
R=rank(A);
[V,D]=eig(A);
tz=max(D);
B=max(tz);
[row,col]=find(D==B);
C=V(:,col);
CI=(B-n)/(n-1);
CR=CI/RI(1,n);
if CR<0.10
    disp('CI=');disp(CI);
    disp('CR=');disp(CR);
    disp('矩阵通过一致性检验，各向量权重向量Q为：');
    Q=zeros(n,1);
    for i=1:n
        Q(i,1)=C(i,1)/sum(C(:,1));
    end
    Q
else
    disp('矩阵没有通过一致性检验，请重新构造');
end