% myPlot.m plots the function y(x)=sinx
% define vectors x and y
x = linspace(0,2*pi,20);
y = 3*cos(x);
% plot x versus y, using a blue line
plot(x,y,'*r:')
% add some text labels
text(0,3*cos(0),'3cos(0)=1')
text(pi/2,3*cos(pi/2),'3cos(pi/2)=0')
text(pi,3*cos(pi),'3cos(pi)=1')
text(3*pi/2,sin(3*pi/2),'sin(3*pi/2)=-1')
% what do you think the below commands do?
% try commenting them out (stick a % in front of the line)
% and see what changes when you run the code again
% or! look in help
axis equal
grid on
set(gcf,'color','white')