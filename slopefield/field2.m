function this()
    [T,Y] = ode45(@f, [0, 10], [2; 1]);
    plot(T, Y(:,1), 'ro-')
    x = T
    y1 = Y(:,1)
end

function Ydash = f(t,Y)
z=Y(1);
y=Y(2);
zdash = t;
ydash = -t+z+cos(t);
Ydash = [zdash; ydash];
end

