clear all

rng(3);

group1 = 0.8*randn(50, 2) + repmat([2 2], 50, 1);
group2 = 0.8*randn(50, 2) + repmat([7 8], 50, 1);
group3 = 0.8*randn(50, 2) + repmat([9 2], 50, 1);

data = [group1; group2; group3];

K = 3;
[centroid, assignment] = KMeans(data, K, 10);

plot(data(assignment == 1, 1), data(assignment == 1, 2), 'ko')
hold on
plot(data(assignment == 2, 1), data(assignment == 2, 2), 'ks')
plot(data(assignment == 3, 1), data(assignment == 3, 2), 'k^')
plot(centroid(:, 1), centroid(:, 2), 'kx', 'MarkerSize', 15, 'LineWidth', 3)
xlabel('x')
ylabel('y')
title('Clusters Discovered by the K-Means Algorithm')
grid on
