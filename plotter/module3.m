M = importdata('Brisbane_Temp.xlsx');
months = M.colheaders(2:13);
years = M.data(10:14,1);
temps = M.data(10:14, 2:13);

meanT = mean(temps);
 
clf;
h1 = plot(meanT.');
hold on
h2 = plot(temps.');
hold off
hXLabel = xlabel('Months');
hYLabel = ylabel('Temperature in Celsius ( ^oC)');
hTitle = title('Brisbane Temperature');

set(h2,'LineWidth',1, 'color', 'b', 'LineStyle', '--')

% Adjust axis properties
xlim([1 12])
set(gca,'XTick',1:2:12,'XTickLabel',{'month 1','month 3','month 5','month 7','month 9','month 11'}, 'Box', 'off', 'TickDir', 'out', 'TickLength', [0.02 0.02], 'YMinorTick', 'on', 'YGrid', 'on')
hLegend = legend(['Mean';num2str(years)], 'Location','southwest');

set([hLegend, gca],'FontSize', 8);

set(hTitle,'FontSize', 12);
set([hXLabel, hYLabel],'FontSize', 10);