function this()
    [T,Y] = ode45(@f, [0 3], 2);

    % Interval bounds
    tmin =0;
    tmax =3;
    ymin=0;
    ymax=2;
    % Grid spacing
    spacing = 0.3;

    % Define x and y coordinates
    [pt , py] = meshgrid(tmin:spacing:tmax,ymin:spacing:ymax);

    % Calculate slopes
    ydash = 1-exp(-4*pt)-2*py;

    % Define slope vector components
    dt = (spacing/2)./sqrt(1+ydash.^2);
    dy = (spacing/2)*ydash./sqrt(1+ydash.^2);

    % Create slope field
    q = quiver(pt, py, dt, dy,'b','AutoScale','off');
    hold on
    plot(T, Y, 'g+')
    plot(T, Y, 'r')
    set(q,'ShowArrowHead','off','LineWidth',1)

    % Set axis and labels
    axis([tmin tmax ymin ymax])
    xlabel('x')
    ylabel('y')
end

function ydash = f(t,y)
    ydash = 1-exp(-4*t)-2*y
end

