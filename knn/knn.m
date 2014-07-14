%% KNN - anant agarwal
clear ; close all; clc
timeVar=cputime;
load nb.matrix;
X = nb;

K = 3; 
initial_centroids = [48386 82741713.60;555 415816.00;1101 125227.20];


idx = findClosestCentroids(X, initial_centroids);

fprintf('Closest centroids for the first 3 examples: \n')
fprintf(' %d', idx(1:3));

centroids = computeCentroids(X, idx, K);

fprintf('\nCentroids computed after initial finding of closest centroids: \n')
fprintf(' %f %f \n' , centroids');


load nb.matrix;
X = nb;
K = 3;
max_iters = 10;

initial_centroids = [48386 82741713.60;555 415816.00;1101 125227.20];

[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);


printf('Total cpu time: %f seconds\n', cputime-timeVar);

