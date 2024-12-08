% Cho dãy s? có d?ng x(n) {..., -2,0,1,4,3,1,5,0,2,...}
% ?ây là m?t dãy s? xác ??nh trong kho?ng h?u h?n t? -1 ??n 3. Tính và th?
% hi?n ph? c?a dãy x(n) t?i 501 ?i?m r?i r?t trong kho?ng [0,pi] theo
% ch??ng trinh m?u
n = -1:3;  x = 1:5;   
k = 0:500; w = (pi/500) * k;   
X = x * (exp(-1j*pi/500)).^(n'*k);   

magX = abs(X);  angX = angle(X);   
realX = real(X);   imagX = imag(X);   

subplot(2,2,1);  plot(k/500, magX);  title('Magnitude Part');   
xlabel('frequency in pi units'); ylabel('Magnitude');  

subplot(2,2,2);   plot(k/500, angX); title('Angle Part');   
xlabel('frequency in pi units');  ylabel('Radians');  

subplot(2,2,3);   plot(k/500, realX);title('Real Part');   
xlabel('frequency in pi units');   ylabel('Real');  

subplot(2,2,4);   plot(k/500, imagX); title('Imaginary Part');   
xlabel('frequency in pi units');   ylabel('Imaginary');  