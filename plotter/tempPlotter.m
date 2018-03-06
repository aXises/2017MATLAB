% load bris_temp % loads temperature variables
clf; % clears any existing figures
h2 = plot(1:12, temp10, 'g');
hold on
h1 = plot(1:12, temp11, 'r');
h3 = plot(1:12, temp12, 'b');
h4 = plot(1:12, temp13, 'k');
 
% some axes formatting for the x-axis
xlim([1 12])
set(gca, 'XTick', 1:12)
set(gca, 'XTickLabel', {'Jan','Feb','Mar','Apr'...
    ,'May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'})
 
% labelling axes and legend
title('Temperature 2010-2013')
xlabel('Months')
ylabel('Temperature in C')
legend('2011','2012','2013','2014')
print('module03.png','-dpng')