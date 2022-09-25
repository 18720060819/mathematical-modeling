function r=exchange3(R)
N=length(R);
K=fix(unifrnd(0,N));
J=fix(unifrnd(0,N-1));
I=fix(unifrnd(0,N-2));
if I==J
    J=J+1;
end
if I==K
    K=K+2;
end
if J==K
    K=K+1;
end

if I>J
    I=I+J;
    J=I-J;
    I=I-J;
end
if I>K
    I=I+K;
    K=I-K;
    I=I-K;
end
if J>K
    J=J+K;
    K=J-K;
    J=J-K;
end


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
    
