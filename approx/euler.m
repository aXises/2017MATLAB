function [f] = my_euler(t_0, y_0, dt, t_f)
    t(1) = t_0
    y(1) = y_0
    for k = 1:10
        t(k+1) = t(k)+dt
        y(k+1)=y(k)+dt*(5*t(k)-10)
    end
    f = 1-exp(-4*t_f)-2*y(t_f);
end


