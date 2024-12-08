% Vi?t ch??ng trình th? hi?n trên ?? th? k?t qu? t??ng t?
% y(n) - y(n-1) + 0.9y(n-2) = x(n) 
n = [-2:3];
x = [0 1 2 3 4 5];
[x11,n11]= sigshift(x,n,1);
[x22,n22]= sigshift(x,n,2);
x111 = -1*x11;
x222 = 0.9*x22;
[x1,n1] = sigadd( x111, n11, x222, n22);
stem(x1, n1);

