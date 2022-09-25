function [fitresult, gof] = createFit(year, population)
%CREATEFIT(YEAR,POPULATION)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : year
%      Y Output: population
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 02-Jan-2020 23:14:10 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( year, population );

% Set up fittype and options.
ft = fittype( 'xm/(1+(xm/3.9-1)*exp(-r*(t-1790)))', 'independent', 't', 'dependent', 'x' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.2 500];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'population vs. year', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel year
ylabel population
grid on


