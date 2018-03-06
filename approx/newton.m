function x = newton(x)
%NEWTON Performs a single iteration of Newton's method.
%   To use Newton's method to compute the root of f(x) with initial
%   guess x1, e.g. if x1 is 10, first use the command (in the Command
                                                       %   Window):
%
%   x = newton(10)
%
%   to compute the next approximate root. Then further approximate
%   roots are computed by repeatedly executing the command:
%
%   x = newton(x)


% Perform one iteration of Newton's method.
n = 2;                      % computed after 1 interation (not really needed until exercise 3)
xp = x;                     % xp is "x-previous" and contains x1
x = xp - f(xp)/fprime(xp)  % x is the next x being computed, x2
% Exercise 3 add while loop here
close all; hold on;
plot(1, xp, 'r^');
grid on
xlabel('x')
ylabel('y')
title('newton approximation')
while abs(x-xp) >= 10^-2 && n < 101
    plot(n, x, 'ro');
    n = n+1;
    xp = x; 
    x = xp - f(xp)/fprime(xp);
end
plot(n, x, 'r*');
% alternative to 'disp' function - keeps things neat!
fprintf('Newton approximates root at %.15f, after %d iteration(s)\n',x,n-1);
fprintf('f(x) at approximate root x is %.6f\n',f(x));
fprintf('|x-xp| is %.6f',abs(x-xp));
% End of function.
end

% To change the function f(x), edit this function.
function y = f(x)
y = x^3 + 3*x^2 - 2*x - 4;
end

% To change the function f'(x), edit this function.
function yprime = fprime(x)
yprime = 3*x^2 + 6*x - 2;
end