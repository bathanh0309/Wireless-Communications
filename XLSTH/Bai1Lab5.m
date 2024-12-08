%lab5 v? ?? th? dãy x(n) = 2d(n+2) - 2d(n-4), -5 <= n <= 5
n = [-5:5];
x = 2*impseq(-2,-5,5) - impseq(4,-5,5);

figure;
stem(n,x);
title('day so theo dau bai 1.5');
xlabel('n');
ylabel('x(n)');