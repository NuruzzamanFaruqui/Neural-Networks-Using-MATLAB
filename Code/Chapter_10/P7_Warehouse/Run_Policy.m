function [steps, outcome] = Run_Policy(Q, use_Random)
  state = 43;
  is_Terminal = 0;
  steps = 0;
  reward = 0;

  while is_Terminal == 0 && steps < 200
    if use_Random
      action = randi(4);
    else
      [~, action] = max(Q(state, :));
    end
    [state, reward, is_Terminal] = Warehouse(state, action);
    steps = steps + 1;
  end

  if is_Terminal == 1 && reward == 20
    outcome = 1;                 % delivered
  elseif is_Terminal == 1
    outcome = -1;                % slipped on a spill
  else
    outcome = 0;                 % ran out of time
  end
end
