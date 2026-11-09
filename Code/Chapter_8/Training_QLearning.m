clear all

rng(3);

Q = zeros(25, 4);

for episode = 1:500
  Q = QLearning(Q);
end
