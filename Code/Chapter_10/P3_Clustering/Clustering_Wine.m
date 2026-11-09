clear all
rng(1);
Load_Wine;

for K = 1:8
  best_Cost = Inf;
  for restart = 1:10
    [centroid, assignment] = KMeans(features, K, 20);
    cost = 0;
    for n = 1:N
      cost = cost + sum((features(n, :) - centroid(assignment(n), :)).^2);
    end
    if cost < best_Cost
      best_Cost = cost;
    end
  end
  within_Cost(K) = best_Cost;
  fprintf('K = %d   within-cluster cost = %7.1f\n', K, best_Cost);
end

for K = 2:6
  [centroid, assignment] = KMeans(features, K, 20);
  fprintf('K = %d   silhouette = %.3f\n', K, Silhouette(features, assignment, K));
end

[centroid, assignment] = KMeans(features, 3, 20);
[score, table] = Purity(assignment, cultivar, 3);

disp('Rows: clusters.  Columns: cultivar 1, 2, 3')
disp(table)
fprintf('Purity = %.1f%%\n', 100*score);
