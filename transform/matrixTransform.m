function [Rx] = matrixTransform(R)
% MOD10TRANSFORM is a function which will visualise the effect of your
% 2-by-2 transformation matrix R on a set of grid points. It will also plot
% the eigenvectors of the matrix R if there are two real eigenvectors.

close all;

minX = -10;
maxX = 10;
minY = -10;
maxY = 10;
n = 10;
pad = 5;

corners = [minX, maxX, minX, maxX; maxY, maxY, minY, minY];
corners = [corners, R*corners];
corners = [min(corners(:)) max(corners(:)) min(corners(:)) max(corners(:))] + pad*[-1,1,-1,1];

A = R-eye(2);

[ evec, evals ] = eig(R)

axis(corners);
axis equal;
xLim = get(gca, 'XLim');
yLim = get(gca, 'YLim');

hold on;
if trace(R)^2-4*det(R) > 0
    nick = 1;
elseif trace(R)^2-4*det(R) == 0
    if isreal(eig(R))
        nick = 1;
    else
        nick = 0;
    end
else
    nick = 0;
end

for t = linspace(0,1,100)
    cla;
    if nick
        sevec = (A*t+eye(2))*evec;
        quiver(0, 0, sevec(1,1)*10, sevec(2,1)*10);
        quiver(0, 0, sevec(1,2)*10, sevec(2,2)*10);
    end
    for x = linspace(minX, maxX, n)
        index = 1;
        for y = linspace(minY, maxY, n)
            if nick
                newXY(:,index) = (A*t+eye(2))*[x;y];
                
            else
                [t1,r1] = cart2pol(x,y);
                [t2,r2] = cart2pol(R(1)*x+R(2)*y,R(3)*x+R(4)*y);
                if t2 >= t1
                    t2 = t2-2*pi;
                end
                [xp, yp] = pol2cart(t1+(t2-t1)*t, r1+(r2-r1)*t);
                newXY(:, index) = [xp;yp];
            end
            index = index+1;
        end
        plot(newXY(1,:), newXY(2,:), '.', ...
            'MarkerEdgeColor',[0.4 (maxX-x)/(maxX-minX) 0.8]);
        plot(newXY(1,1), newXY(2,1), '.m');
        plot([0, 0],yLim,'-k');
        plot(xLim,[0,0],'-k');
    end
    
    if t == 0
        pause(1);
    else
        pause(0.005);
    end
end

end



