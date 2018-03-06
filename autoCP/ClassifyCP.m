function [ output ] = ClassifyCP(f, var1, var2, xcp, ycp)
% CLASSIFYCP is a function that can determine
% if a critical point is a local maximum
% Example use and output:
%>> ClassifyCP('-(x^2-1)^2-(x^2*y-x-1)^2','x', 'y',-1,0)
%
% ans =
%
% The critical point (x,y)=(-1,0) is a local maximum
var1 = sym(var1);
var2 = sym(var2);
f = evalin(symengine,f);

% Calculate the first and second order partial derivatives
fx = diff(f,var1);
fy = diff(f,var2);
fxx = diff(fx, var1);
fxy = diff(fx, var2);
fyy = diff(fy, var2);

% Calculate Discriminant and 2nd order partials by
% subbing in critical point with subs()
D = (fxx)*(fyy)-(fxy)^2
D = simplify(D);
Dval = subs(D, {var1,var2}, [xcp, ycp] )
fxxval = subs(fxx, {var1, var2}, [xcp, ycp] )
fyyval = subs(fyy, {var1, var2}, [xcp, ycp] );

% Classify the critical point
if Dval > 0 && fxxval < 0
    classtext= ['a local maximum'];
elseif Dval > 0 && fxxval > 0
    classtext= ['a local minimum'];
elseif Dval < 0 
    classtext= ['a saddle point'];
else
    classtext= ['cannot be categorised'];
end

output = ['The critical point (x,y)=(',...
    num2str(xcp),',',num2str(ycp),') is ',classtext];
