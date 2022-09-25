T=[];l=0;%l记录T的列数
q(1)=-1;
for i=2:n
    p(i)=1;q(i)=D(i,1);
end
k=1;
while 1
    if k>=n
        disp(T);
        break;
    else
        min=inf;
        for i=2:n
            if q(i)>0&q(i)<min
                min=q(i);
                h=i;
            end
        end
    end
    l=l+1;
    T(1,l)=h;T(2,l)=p(h);
    q(h)=-1;
    for j=2:n
        if D(h,j)<q(j)
            q(j)=D(h,j);
            p(j)=h;
        end
    end
    k=k+1;
end
