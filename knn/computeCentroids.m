function centroids = computeCentroids(X, idx, K)

[m n] = size(X);

centroids = zeros(K, n);

for j = 1:K,
  matching_indices = idx == j;
  num_matching_points = length(find(matching_indices));
  points_for_centroid = X .* repmat(matching_indices, 1, n);
  centroids(j, :) = sum(points_for_centroid) / num_matching_points;
end

end

