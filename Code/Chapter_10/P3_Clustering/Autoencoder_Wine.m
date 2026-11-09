clear all
rng(2);
Load_Wine;

weight1 = 0.1*(2*rand(2, 13) - 1);
weight2 = 0.1*(2*rand(13, 2) - 1);

for epoch = 1:600
  [weight1 weight2] = BackPropagation_Compress(weight1, weight2, features);

  if mod(epoch, 200) == 0
    Output = (weight2*Sigmoid(weight1*features'))';
    fprintf('epoch %3d   reconstruction error = %.3f\n', epoch, mean(mean((features - Output).^2)));
  end
end

code = Sigmoid(weight1*features')';

[centroid, assignment] = KMeans(code, 3, 20);
[score, table] = Purity(assignment, cultivar, 3);

fprintf('Silhouette in the 2-number code space = %.3f\n', Silhouette(code, assignment, 3));
disp(table)
fprintf('Purity = %.1f%%\n', 100*score);
