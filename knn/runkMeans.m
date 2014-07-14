function [centroids, idx] = runkMeans(X, initial_centroids, ...
                                      max_iters, plot_progress)


if ~exist('plot_progress', 'var') || isempty(plot_progress)
    plot_progress = false;
end


if plot_progress
    figure;
    hold on;
end


[m n] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
previous_centroids = centroids;
idx = zeros(m, 1);


for i=1:max_iters
    

    fprintf('K-Means iteration %d/%d...\n', i, max_iters);
    if exist('OCTAVE_VERSION')
        fflush(stdout);
    end
    
 
    idx = findClosestCentroids(X, centroids);
    

    if plot_progress
        plotProgresskMeans(X, centroids, previous_centroids, idx, K, i);
        previous_centroids = centroids;

%        pause;
    end
    
 
    centroids = computeCentroids(X, idx, K);
end


if plot_progress
    hold off;
end

end

