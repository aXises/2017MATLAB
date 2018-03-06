T = [46 24; -24 -4]/10;
[evecs,evals] = eig(T)
v1 = evecs(:,1); % first eigenvector
v2 = evecs(:,2); % second eigenvector
u1 = T*v1;
u2 = T*v2;
clf; % clears the figure of previous plots
hold on
quiver(0, 0, u1(1), u1(2), 'Color', 'k');
quiver(0, 0, u2(1), u2(2), 'Color', 'k');
quiver(0, 0, v1(1), v1(2), 'Color', 'k');
quiver(0, 0, v2(1), v2(2), 'Color', 'k');
x = [1; 0];
y = [0; 1];
quiver(0,0,x(1),x(2), 'Color', 'b');
quiver(0,0,y(1),y(2), 'Color', 'r');
x1 = T*T*x;
y1 = T*T*y;
quiver(0,0,x1(1),x1(2), 'Color', 'c');
quiver(0,0,y1(1),y1(2), 'Color', 'm');
axis equal
