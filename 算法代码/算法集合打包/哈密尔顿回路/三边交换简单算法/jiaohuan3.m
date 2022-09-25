R=1:N;

n=0;
for I=1:(N-2)
    for J=(I+1):(N-1)
        for K=(J+1):N
            n=n+1;
            Z(n,:)=[I J K];
        end
    end
end

for m=1:(N*(N-1)*(N-2)/6)
    I=Z(m,1);J=Z(m,2);K=Z(m,3);
    r=R;
    if J-I~=1&K-J~=1&K-I~=N-1
        for q=1:(J-I)
            r(I+q)=R(J+1-q);
        end
        for q=1:(K-J)
            r(J+q)=R(K+1-q);
        end
    end
    if J-I==1&K-J==1
        r(K)=R(J);r(J)=R(K);
    end
    if J-I==1&K-J~=1&K-I~=N-1
        for q=1:(K-J)
            r(I+q)=R(I+1+q);
        end
        r(K)=R(J);
    end
    if K-J==1&J-I~=1&K~=N
        for q=1:(J-I)
            r(I+1+q)=R(I+q);
        end
        r(I+1)=R(K);
    end
    if I==1&J==2&K==N
        for q=1:(N-2)
            r(1+q)=R(2+q);
        end
        r(N)=R(2);
    end
    if I==1&J==(N-1)&K==N
        for q=1:(N-2)
            r(q)=R(1+q);
        end
        r(N-1)=R(1);
    end
    if J-I~=1&K-I==N-1
        for q=1:(J-1)
            r(q)=R(1+q);
        end
        r(J)=R(1);
    end
    if J==(N-1)&K==N&J-I~=1
        r(J+1)=R(N);
        for q=1:(N-J-1)
            r(J+1+q)=R(J+q);
        end
    end
    if cost_sum(r,C,N)<cost_sum(R,C,N)
        R=r
    end
end
fprintf('×Ü³¤Îª%f\n',cost_sum(R,C,N))
