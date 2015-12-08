% 2.1 Data and Fit
%%

% Read File 
M = dlmread ( 'cambridge.dat', ' ', 4,3);

%Since the Genius who made the file decided to delimit with spaces not tabs
%NEED Quirks to get actual data out.
yy   = M(:,1);                               %get Months 
mm   = M(:,3)  + M(:,4) ;                    %Get Years
tmax = M(:,6)  + M(:,7)  + M(:,8);           %Get Rest of Data
tmin = M(:,11) + M(:,12) + M(:,13);
af   = M(:,17) + M(:,18) + M(:,19) + M(:, 20);
rain = M(:,21) + M(:,22) + M(:,23) + M(:, 24);
% A standing ovation to MathWorks. Even the Simplest compilers would just
% Throw away all spaces and give you a nice table. 

% Define Floatpoint Years

t = yy + (mm-1)/12;
avtemp = (tmax + tmin)/2;   

% Plot 
hold on
plot (t,avtemp,'k+');   %Plot using black line with + Markers
xlabel ('Year','fontsize', 14); 
ylabel ('Average Temperature in Cambridge in degrees Celsius', 'fontsize', 14);
set (gca, 'fontsize', 14, 'linewidth', 1);  %Nice Touch

%Perform Fit 
% Create a vector of initial trial Values
a_0 = [10, 0.1, 5.5, 0];   % a_0 a_1 a_2 \delta

%Need to define slsine.m to use chi^2 fit
% because:
%  a) Makes code concise and human readable
%  b) makes the second argument a function by all definitions
%  which is impossible to make in the same file: see 
%  http://stackoverflow.com/questions/5363397/
%  in-matlab-can-i-have-a-script-and-a-function-definition-in-the-same-file

%Fit to the Graph
a = fminsearch ( @(a) slsine(a,t,avtemp),a_0)

% Result of Computation is 
% a_0 = 9.3257    
% a_1 = 0.0308
% a_2 =-6.6440
% \delta = 1.4156
plot (t,a(1) + a(2) * (t-1961) + a(3) * sin (2*pi*t + a(4)),'k')
xlim ([1960,2017]);
ylim ([-5,25]);
hold off
print -dsvg ChangeInTemp.svg

%% 
%(a) 

%The rise of the Temperature is a(2) * 50 
a(2)*50
% = 1.5376

%(b) histogram
histogram (rain, 10)
xlabel ('Precipitation in mm','fontsize', 14); 
ylabel ('Frequency', 'fontsize', 14);
set (gca, 'fontsize', 14, 'linewidth', 1);  
print -dsvg Rain.svg

%(c) The Graphs Are of Good Quality, Change in Temp needs to be 
% Flipped 90 degrees, to be more visible


