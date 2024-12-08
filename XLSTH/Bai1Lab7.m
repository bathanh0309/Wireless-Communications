% Vi?t ch??ng trình th? hi?n ?? th? k?t qu? phép tích ch?p gi?a 2 dãy sau:
% x(n) = rect6(n)   
% h(n) = 1-(n/4)   0 <= n <= 4    
% h(n) = 0         n còn l?i
% v?i  -4 <= n <= 10
n = -4:10;
x = zeros(size(n));
x(n >= -3 & n < 3) = 1;

h = zeros(size(n));
h(n >= 0 & n < 4) = 1 - n(n >= 0 & n < 4) / 4;
y = conv(x, h, 'full');
n_y = -8:20;

figure;
stem(n_y, y, 'filled');
title('y(n) = x(n) * h(n)');
xlabel('n');
ylabel('y(n)');
grid on;
