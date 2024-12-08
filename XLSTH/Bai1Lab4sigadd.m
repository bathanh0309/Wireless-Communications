%ham cong 2 day
function [y,n] = sigadd(x1, n1, x2, n2)
%th?c hi?n y(n) = x1(n) +x2(n)
%[y,n] = sigadd(x1, n1, x2, n2)
% y = day tong co vecto chi so n
%x1= day thu nhat co vector chi so n1
%x2 = day thu hai co vector chi so n2(n2 co the khac n1)
n = min(min(n1),min(n2)):max(max(n1),max(n2));

y1 = zeros(1,length(n));
y2 = y1;

y1 (find((n>=min(n1))&(n<=max(n1))==1))=x1;
y2 (find((n>=min(n2))&(n<=max(n2))==1))=x2;

y = y1+y2;
%%%
x1 =[2:5]    x1 = 2     3     4     5
n1 = [-1:2]  n1 =-1     0     1     2
x2 = [3:6]   x2 = 3     4     5     6
n2 = [4:7]   n2 = 4     5     6     7
[y,n] = sigadd(x1,n1,x2,n2)
y =     2     3     4     5     0     3     4     5     6
n =    -1     0     1     2     3     4     5     6     7
%% hàm nhân: sigmult(x1,n1,x2,n2)
%% hàm tr? d?ch: sigshift(x1,n1,x2,n2)
%% hàm bi?n s? n ??o: sigfold(x1,n1,x2,n2)
