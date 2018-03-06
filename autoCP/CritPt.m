function [ cr ] = CritPt(f, var1, var2)
    f = evalin(symengine, f);
    var1 = sym(var1);
    var2 = sym(var2);
    fx = diff(f, var1);
    fy = diff(f, var2);
    [xcr, ycr] = solve(fx, fy);
    cr = [xcr, ycr];
    cr = double(cr);
end