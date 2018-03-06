% ZOMBIE Calculates the population growth of Greater Brisbane after a
% ZOMBIE APOCALYPSE breaks out!!!

% I usually put these lines at the top of the script to make sure I start
% fresh each time I run the script
close all;
clear all;

% convert from number of years into number of weeks
numYears = 2;
numWeeks = 52*numYears;

% the current human growth rate
hGrowthRate = 0.00057; 

% the rate of which zombies infect humans
% rate of infection is proportional to rate at which zombie and human meet,
% and human gets infected
zInfectionRate= 10^(-6.5); 

% the rate at which zombies die, or are killed                     
zDecayRate = 0.01;

% here we use the function ZEROS to create a vector with numWeeks number of
% elements, this is so the computer knows how much computer memory to give 
% to the vector, before we start calculating the population each week
hPop = zeros(1, numWeeks);
zPop = zeros(1, numWeeks);

% initialising the first element of the vector with current population size
week = 1;
hPop(week) = 2.2e+06;
zPop(week) = 2; % let's say that two scientists at UQ accidentally infect themselves

% while the current week is not yet equal to total number of weeks
% (numWeeks), keep calculating the population 
while week < numWeeks
    week = week + 1;
    
    hPop(week) = floor((1+hGrowthRate)*hPop(week-1) - zInfectionRate*hPop(week-1)*zPop(week-1));
    zPop(week) = floor((1-zDecayRate)*zPop(week-1) + zInfectionRate*hPop(week-1)*zPop(week-1));
    if week > 30
        zombieQuota = 7; %change this value
        numZombiesKilled = hPop(week)*zombieQuota;
        if numZombiesKilled < zPop(week)
            zPop(week) = zPop(week) - numZombiesKilled;
        else
            zPop(week) = 0;
    end
end
end

% just a bit of fun, ignore this next bit of code :)
if (hPop(end) == 0)
    img = imread('zombie.png'); % copyright Plants Vs Zombies PopCap
    img = 255-img; 
    hold on;
    image([3*numWeeks/6 5*numWeeks/6],[3*max(hPop)/4, max(hPop)/4],img);
    text(4*numWeeks/6+20, 3*max(hPop)/4 - 5000, 'ZOMBIES WIN!');
else
    hold on;
    text(3*numWeeks/6+20, 3*max(hPop)/4 - 5000, [num2str(hPop(end)), ' HUMANS SURVIVED!']);
end

% to visualise the population forecast we've just generated, we use the
% plot command to quickly analyse the outcome of the ZOMBIE APOCALYPSE!!!
plot(1:numWeeks, hPop, 'b-', 1:numWeeks, zPop, 'r-');
title('Human vs Zombie population over time');
xlabel('Week no.');
ylabel('Population size');
legend('Humans','Zombies');
axis([1, numWeeks, 0, 1.05*max([max(hPop), max(zPop)])]);

print('apocalypse.png', '-dpng')