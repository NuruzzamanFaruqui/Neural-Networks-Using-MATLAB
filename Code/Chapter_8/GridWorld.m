function [next_State, reward, is_Terminal] = GridWorld(state, action)
  cheese_State = 5;
  cat_States   = [7 9 11 19];

  row = floor((state - 1) / 5) + 1;
  col = mod(state - 1, 5) + 1;

  if action == 1                 % up
    row = max(row - 1, 1);
  elseif action == 2             % down
    row = min(row + 1, 5);
  elseif action == 3             % left
    col = max(col - 1, 1);
  else                           % right
    col = min(col + 1, 5);
  end

  next_State = (row - 1)*5 + col;

  if next_State == cheese_State
    reward      = 1;
    is_Terminal = 1;
  elseif any(next_State == cat_States)
    reward      = -1;
    is_Terminal = 1;
  else
    reward      = 0;
    is_Terminal = 0;
  end
end
