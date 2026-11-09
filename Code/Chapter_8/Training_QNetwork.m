clear all

rng(1);

alpha = 0.05;
gamma = 0.9;

weight1 = 2*rand(20, 25) - 1;
weight2 = 2*rand( 4, 20) - 1;

for episode = 1:5000
  epsilon = max(0.5*(1 - episode/3000), 0.1);

  state = 21;
  is_Terminal = 0;
  steps = 0;

  while is_Terminal == 0 && steps < 50
    input_Vector = zeros(25, 1);
    input_Vector(state) = 1;

    v1 = weight1*input_Vector;
    y1 = Sigmoid(v1);
    Q  = weight2*y1;

    if rand < epsilon
      action = randi(4);
    else
      [~, action] = max(Q);
    end

    [next_State, reward, is_Terminal] = GridWorld(state, action);

    next_Vector = zeros(25, 1);
    next_Vector(next_State) = 1;
    next_Q = weight2*Sigmoid(weight1*next_Vector);

    target = reward + gamma*max(next_Q)*(1 - is_Terminal);
    error  = target - Q(action);

    delta = zeros(4, 1);
    delta(action) = error;

    hidden_layer_error = weight2'*delta;
    delta1 = y1.*(1-y1).*hidden_layer_error;

    weight1 = weight1 + alpha*delta1*input_Vector';
    weight2 = weight2 + alpha*delta*y1';

    state = next_State;
    steps = steps + 1;
  end
end
