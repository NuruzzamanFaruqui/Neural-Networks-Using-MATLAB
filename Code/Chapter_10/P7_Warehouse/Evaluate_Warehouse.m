clear all

number_Of_Seeds = 20;
number_Of_Trials = 100;

delivered = 0;  slipped = 0;  total_Steps = 0;
random_Delivered = 0;  random_Slipped = 0;

for seed = 1:number_Of_Seeds
  rng(seed);
  Q = zeros(49, 4);
  for episode = 1:1500
    Q = QLearning_Warehouse(Q, max(0.05, 1 - episode/800));
  end

  [steps, outcome] = Run_Policy(Q, false);
  delivered   = delivered + (outcome == 1);
  slipped     = slipped + (outcome == -1);
  total_Steps = total_Steps + steps*(outcome == 1);
end

for trial = 1:number_Of_Trials
  [steps, outcome] = Run_Policy(zeros(49, 4), true);
  random_Delivered = random_Delivered + (outcome == 1);
  random_Slipped   = random_Slipped + (outcome == -1);
end

fprintf('Trained robot, %d separate trainings:\n', number_Of_Seeds);
fprintf('  delivered %d of %d, slipped %d, average %.1f steps (shortest possible: 12)\n', ...
        delivered, number_Of_Seeds, slipped, total_Steps/max(delivered, 1));
fprintf('Random robot, %d trials: delivered %d, slipped %d\n', ...
        number_Of_Trials, random_Delivered, random_Slipped);
