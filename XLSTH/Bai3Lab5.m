% Cho hàm X(z) v?i công th?c sau
% X(z) = 1/(1-0.9z^-1)^2(1-0.9z^-1)
% Vi?t ch??ng trình tính các ?i?m c?c, th?ng d? c?a các ?i?m c?c c?a hàm
% X(z) 
b = 1;
a = poly([0.9 0.9 0.9]);
[R,P,C] = residuez(b,a)
%
>> [R,P,C] = residuez(b,a)
R =
   0.0000 - 0.0000i
  -0.0000 + 0.0000i
   1.0000 + 0.0000i
P =
   0.9000 + 0.0000i
   0.9000 + 0.0000i
   0.9000 - 0.0000i
C =
     []
>> a
a =
    1.0000   -2.7000    2.4300   -0.7290
>> b
b =
     1
