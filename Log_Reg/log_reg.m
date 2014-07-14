%% Logistic Regression
%
% 
%  This file contains code that takes the 
%  classification data from  - abdln.matrix 
%  with corresponding classes from - abdln_classes.matrix  
%
% Its associated files are : 
%     sigmoid.m
%     costFunction.m

%% Initialization
clear ; close all; clc

timeVar = cputime;

%% Load Data
%  abdln.matrix contains the feature set X and 
%  abdln_classes.matrix contains the label(classes) y.

data = load('localhost_bigtrace.matrix');
data1 = load('localhostbigtrace_classes.matrix');

l = size(data,2);
X = data(:, [1:l]); 
y = data1(:, 1);

[m, n] = size(X);

% Add intercept term to x and X_test
X = [ones(m, 1) X];

%% ============= Obtaining theta for CLASS 1 =============

y1 = zeros(m,1);
for i=1:m
    if y(i)==1,
        y1(i) = 1;
    end
end

% Initialize fitting parameters
initial_theta1 = zeros(n + 1, 1);

% Compute and display initial cost and gradient
[cost1, grad1] = costFunction(initial_theta1, X, y1);

%  Set options for fminunc
options1 = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta1, cost1] = ...
	fminunc(@(t1)(costFunction(t1, X, y1)), initial_theta1, options1);

%fprintf('\nProgram paused. Press enter to continue.\n');
%pause;

%% ============= Obtaining theta for CLASS 2 =============

y2 = zeros(m,1);
for i=1:m
    if y(i)==2,
        y2(i) = 1;
    end
end

% Initialize fitting parameters
initial_theta2 = zeros(n + 1, 1);

% Compute and display initial cost and gradient
[cost2, grad2] = costFunction(initial_theta2, X, y2);

%  Set options for fminunc
options2 = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta2, cost2] = ...
	fminunc(@(t2)(costFunction(t2, X, y2)), initial_theta2, options2);

%fprintf('\nProgram paused. Press enter to continue.\n');
%pause;


%% ============= Obtaining theta for CLASS 3 =============

y3 = zeros(m,1);
for i=1:m
    if y(i)==3,
        y3(i) = 1;
    end
end

% Initialize fitting parameters
initial_theta3 = zeros(n + 1, 1);

% Compute and display initial cost and gradient
[cost3, grad3] = costFunction(initial_theta3, X, y3);

%  Set options for fminunc
options3 = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta3, cost3] = ...
	fminunc(@(t3)(costFunction(t3, X, y3)), initial_theta3, options3);

%fprintf('\nProgram paused. Press enter to continue.\n');
%pause;




%% ============== Predicton and Accuracies ==============
%  After learning the parameters, we can use it to predict the outcomes
%  on unseen data. In this part,we will use the logistic regression model
%  to predict the classes of data in file - input_abdln.matrix
%
%  Furthermore, we will compute the training and test set accuracies of 
%  our model.

%% Load Data
%  input_abdln.matrix contains the feature set X and 

data = load('input_bigtracelocalhost.matrix');
l = size(data,2);
X = data(:, [1:l]); 
[m, n] = size(X);
out = zeros(m,1);

% Add intercept term to x and X_test
X = [ones(m, 1) X];


for i = 1:m

h1 = sigmoid( X(i,:) * theta1);
h2 = sigmoid( X(i,:) * theta2);
h3 = sigmoid( X(i,:) * theta3);

if h1 > h2,
    cl = 1;
    maxh = h1;
    if maxh < h3,
        cl = 3;
        maxh = h3;
    end
else
    cl = 2;
    maxh = h2;
    if maxh < h3,
        cl = 3;
        maxh = h3;
    end
endif
   
out(i) = cl;
end

save result.matrix out;

printf('Total cpu time: %f seconds\n', cputime-timeVar);

