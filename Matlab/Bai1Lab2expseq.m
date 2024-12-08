% Vi?t ch??ng trình t?o dãy hàm m?
function [x,n] = expseq(a,n1,n2)
%tao ra day x[n] = a^n; n1 <=n<=n2
%[x,n] = expseq(a, n1,n2)
n = [n1:n2];
x = [a.^n];

% V? bi?u ??
plot(n, x);
xlabel('n');
ylabel('x[n]');
title('Bieu do ham expseq(a, nl, n2)');

%%% 
>> expseq(5,2,4)

ans =

    25   125   625
