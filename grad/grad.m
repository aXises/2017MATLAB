function output = fun(input)
% MYFUNCTION Calculates Grad(u) for the
% function u = sin(x)cos(y)
X = input(1);
Y = input(2);
Z = (X.^2-1).^2+((X.^2).*Y-X-1).^2;
output = Z;