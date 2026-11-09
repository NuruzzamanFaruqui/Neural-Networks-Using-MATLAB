function [next_State, reward, is_Terminal] = Warehouse(state, action)
  station_State = 7;
  shelf_States  = [10 11 13 14 24 25 27 28 38 39 41 42];
  spill_States  = [3 31 45];

  row = floor((state - 1) / 7) + 1;
  col = mod(state - 1, 7) + 1;

  if action == 1                 % up
    row = max(row - 1, 1);
  elseif action == 2             % down
    row = min(row + 1, 7);
  elseif action == 3             % left
    col = max(col - 1, 1);
  else                           % right
    col = min(col + 1, 7);
  end

  next_State  = (row - 1)*7 + col;
  reward      = -1;
  is_Terminal = 0;

  if any(next_State == shelf_States)
    next_State = state;          % bumped into a shelf
    reward     = -2;
  elseif next_State == station_State
    reward      = 20;
    is_Terminal = 1;
  elseif any(next_State == spill_States)
    reward      = -10;
    is_Terminal = 1;
  end
end
