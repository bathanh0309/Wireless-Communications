
%....
h = [0.1, 0.2, 0.3, 0.4, 0.3, 0.2, 0.1]; 
[Hr, w, b, L] = Hr_Type2(h);
figure;
plot(w, abs(Hr)); 
xlabel('T?n s? (rad/s)');
ylabel('?? l?n');
title('?áp ?ng t?n s? c?a b? l?c lo?i FIR 2');
grid on;

