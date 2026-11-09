clear all

budget = [5 10 15 20 25 30 40 80];
number_Of_Seeds = 50;

delivered_Rate = zeros(1, length(budget));
slipped_Rate   = zeros(1, length(budget));

for b = 1:length(budget)
  for seed = 1:number_Of_Seeds
    rng(seed);
    Q = zeros(49, 4);
    for episode = 1:budget(b)
      Q = QLearning_Warehouse(Q, 0.2);
    end

    [steps, outcome] = Run_Policy(Q, false);
    delivered_Rate(b) = delivered_Rate(b) + (outcome == 1)/number_Of_Seeds;
    slipped_Rate(b)   = slipped_Rate(b) + (outcome == -1)/number_Of_Seeds;
  end
end

budget
delivered_Rate
slipped_Rate
