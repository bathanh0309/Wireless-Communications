% Cho ph? X(e^jw) có d?ng Xe^iw = e^-jw/2 sin3w
% Vi?t ch??ng trình th? hi?n trên ?? th? các hàm ph? biên ??, ph? pha, ph?n
% th?c, ph?n ?o, tính t?i 2001 ?i?m r?i r?t trong kho?ng [-2pi, 2pi]
w = [-1000:1:1000]*pi/500;
x = exp(-j*w/2).*sin(3*w);
magX = abs(x); angX = angle(x);
realX = real(x); imagX = imag(x);

subplot(2,2,1); plot(w/pi,magX); grid;title('Magnitude Part'); 
xlabel('frequency in pi units');ylabel('Magnitude');

subplot(2,2,3); plot(w/pi,angX); grid; title('Angle Part'); 
xlabel('frequency in pi units');ylabel('Angle');

subplot(2,2,2); plot(w/pi,realX); grid;title('Real Part'); 
xlabel('frequency in pi units');ylabel('Real');

subplot(2,2,4); plot(w/pi,imagX); grid;title('Imaginary Part'); 
xlabel('frequency in pi units');ylabel('Imaginary');
