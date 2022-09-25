function h1 = makeh1(h0)

n = length(h0);
h1 = h0(n:-1:1);
h1(2:2:n) = -h1(2:2:n);

