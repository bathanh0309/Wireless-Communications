% M?t hàm ? mi?n Z v?i công th?c: X(z) = z/(3^2 - 4z +1)
b = [0 1];
a = [3 -4 1];
[R, P, C] = residuez(b,a)
[b a] = residuez(R, p, C)
%%
>> b = [0 1]                  b =     0     1
>> a = [3 -4 1]               a =     3    -4     1
>> [R, P, C]                  ans =    0.5000    1.0000   -0.5000    0.3333
>> [R, P, C] = residuez(b,a)  
R =    0.5000   -0.5000
P =    1.0000    0.3333
C =     []
>> [b,a] = residuez(R,P,C)
b =   -0.0000    0.3333
a =    1.0000   -1.3333    0.3333
%%
>> syms z
>> iztrans(0.5*z/(z-1)) + iztrans(1.5*z/(3*z-1))
ans =(1/3)^n/2 + 1/2
 