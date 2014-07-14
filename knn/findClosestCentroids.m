function idx = findClosestCentroids(X, centroids)

K = size(centroids, 1);

idx = zeros(size(X,1), 1);


for i = 1:size(X,1),
  example = X(i, :);
  min_norm = 9999999999999999999999; % set it to a huge value so that all norm values will be less than it

  for j = 1:K,
    centroid = centroids(j, :);
    this_norm = norm(example - centroid);

    if this_norm < min_norm,
      min_norm = this_norm;
      idx(i) = j;
    end;
  end
end


end

