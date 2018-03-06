function [ out ] = CritPt2(varargin)
    f = evalin(symengine,varargin{1});
    switch nargin
        case 2
            x = varargin{2};
            fx = diff(f,x);
            xcr = solve(fx);
            out = xcr;
        case 3
            x = varargin{2};
            y = varargin{3};
            fx = diff(f,x);
            xcr = solve(fx);
            fy = diff(f, y);
            ycr = solve(fy);
            [xcr,ycr]=solve(fx,fy);
            out = [xcr,ycr];
        case 4
            x = varargin{2};
            y = varargin{3};
            z = varargin{4};
            fx = diff(f,x);
            xcr = solve(fx);
            fy = diff(f, y);
            ycr = solve(fy);
            fz = diff(f, z);
            zcr = solve(fz);
            [xcr,ycr,zcr]=solve(fx,fy,fz);
            out = [xcr,ycr];
        otherwise
            error('CritPt2:InputTest','Error using CritPt2, too many input arguments. \n Example 1 (Single variable): CritPt2("x^2+x-1","x"), \n Example 2 (Two variables): CritPt2("(x^2-1)^2+(x^2*y-x-1)^2","x", "y"),\n Example 3 (Three variables): CritPt2("(x^2-1)^2+(x^2*y-x-1)^2*z","x", "y", "z").')

    end    
end