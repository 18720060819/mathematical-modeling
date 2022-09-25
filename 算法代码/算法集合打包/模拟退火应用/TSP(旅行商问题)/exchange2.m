function r=exchange2(R)
N=length(R);
I=1+fix(unifrnd(0,N));
J=1+fix(unifrnd(0,N-1));
if I==J
    J=J+1;
end
if J<I
    I=I+J;
    J=I-J;
    I=I-J;
end
r=R;
if J-I~=1&J-I~=N-1
    for p=1:(J-I)
        r(I+p)=R(J-p+1);
    end
end
if J-I==1
    r(I)=R(J);
    r(J)=R(I);
end
if J-I==N-1
    for p=1:(N-2)
        r(p+2)=R(N+1-p)
    end
end