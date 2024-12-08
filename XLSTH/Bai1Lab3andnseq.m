function [x,n] = randnseq(n1,n2)
%generates x(n) = a^n; n1 <= n <= n2
%[x,n] = r_expseq(a,n1,n2)
n = [n1:n2];
x = randn(size(n));

