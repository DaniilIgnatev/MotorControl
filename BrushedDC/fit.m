

% Example data
x = [1, 2, 3, 4, 5]; % Predictor variable
y = [2, 4, 5, 4, 5]; % Response variable

% Fit a linear model (1st degree polynomial)
p = polyfit(x, y, 1);

% Get the slope and intercept
slope = p(1);
intercept = p(2);

% To make predictions based on the model
y_fit = polyval(p, x);