% Cho h? th?ng nhân qu? bi?u di?n b?i pt sau:
% y(n) - 0.9y(n-1) = x(n)

b = [1 0]; a = [1 -0.9];
subplot(1,2,1);
zplane(b,a);
title('Zplane');
% tìm ?áp ?ng t?n s? b?ng cách ?ánh giá 200 ?i?m r?i r?t
[H, w] = freqz(b,a,200,'whole');
magH = abs(H(1:101));
phaH = angle(H(1:101));
%v? ?áp ?ng t?n s?
subplot(2,2,2); plot(w(1:101)/pi,magH); grid;
title('Magnitude Response');
xlabel('frequency in pi units');
ylabel('Magnitude');
subplot(2,2,4); plot(w(1:101)/pi,phaH/pi); grid;
title('Phase Response');
xlabel('frequency in pi units');
ylabel('Phase in pi units');