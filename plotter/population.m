% POPULATION Calculates the population growth of Greater Brisbane
% This is a script which uses the projected Growth Rate of Greater Brisbane
% to model and visualise the population growth, based on the current
% population size of 2.2 million people, and a growth rate of 0.0057

% I usually put these lines at the top of the script to make sure I start
% fresh each time I run the script
close all, clear all;

% convert from number of years into number of weeks
% (because we're lazy)
numYears = 20;
numWeeks = 52*numYears;

% the current human growth rate
hGrowthRate = 0.00057;

% here we use the function ZEROS to create a vector with numWeeks number of
% elements, this is so the computer knows how much computer memory to give 
% to the vector, before we start calculating the population each week
hPop = zeros(1, numWeeks); 

% initialising the first element of the vector with current population size
week = 1; % we start off looking at week number 1
hPop(week) = 2.2e+06; % population of Greater Brisbane

% while loop:
% "while the current week is not yet equal to total number of weeks
% (numWeeks), keep calculating the population"
while hPop < 10e6
   week = week + 1;
    % calculate the population of humans for the current week, based on the 
    % population from the previous week hPop(week-1), and the growth rate
    % the FLOOR function is used to round the number down - e.g. 1.8 humans
    % needs to be rounded down to 1 human (can't really have 0.8 of a
    % person, but we can save that debate for another day)
   hPop(week) = floor((1+hGrowthRate)*hPop(week-1));
end

% because of the increasing growth rate, the maximum population size will
% be the last element of the element hPop
hPopMax = hPop(end)
grid on
% to visualise the population forecast we've just generated, we use the
% plot command to quickly analyse the growth
plot(1:length(hPop),hPop);
title('Human population over time');
xlabel('Week no.');
ylabel('Population size');
axis([1, length(hPop), hPop(1), hPop(end)]);

print('humanPop.png', '-dpng')