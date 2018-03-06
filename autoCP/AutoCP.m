function [ output ] = AutoCP(f,var1,var2)
% example usage: AutoCP('x^2*y+(1-y)^2','x','y')
cp = CritPt(f,var1,var2);
S = size(cp);
col = S(1);
row = S(2);
par = [];

for i1 = 1:row
   s = ClassifyCP(f,var1,var2,cp(1,i1),cp(2,i1));
   par = char(par, s);
end
 
output = par;
end




