% Cho h? th?ng nh�n qu? bi?u di?n pt:
% y(n) - 0.81y(n-2) = x(n) - x(n-2)
% c�u a: vi?t ct h�m truy?n ??t H(z) = Y(z)|1-0.81z^(-2)| = X(z)|1-z^(-2)|
%H(z) = Y(z)/X(z) = 1-z^(-2) / 1-0.81z^(-2)
% c�u b: C�c ?i?m c?c l� z1= 0,9; z2 = -0,9
% c�u c = 
>> b= [1 0 -1]; 
>> a = [1 0 0,81];
subplot(1, 2, 1);
zplane(b,a);
title('Zplane');

[H, w] = freqz(b,a,200,'whole');
magH = abs(H(1:101));
phaH = angle(H(1:101));

subplot(2,2,2);
plot(w(1:101)/pi,magH); grid;
title('Magnitude Response');
xlabel('frequency in pi units');
ylabel('Magnitude');

subplot(2,2,4);
plot(w(1:101)/pi,phaH/pi); grid;
title('Phase Response');
xlabel('frequency in pi units');
ylabel('Phase in pi units');

