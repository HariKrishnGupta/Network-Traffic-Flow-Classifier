function plotDataPoints(X, idx, K)

colormap(hsv(K + 1)(1:end-1, :));
scatter(X(:,1), X(:,2), 15, idx);

end

