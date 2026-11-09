function [weight1, weight2, mmt1, mmt2] = BackPropagation_Momentum(weight1, weight2, mmt1, mmt2, input, correct_output)

alpha = 0.9;
beta  = 0.9;

N = 4;
for k = 1:N

    transposed_Input = input(k, :)';
    C = correct_output(k);

    % -------- Forward propagation --------
    v1 = weight1*transposed_Input;
    y1 = Sigmoid(v1);

    v = weight2*y1;
    Output = Sigmoid(v);

    error = C - Output;
    delta = Output.*(1-Output).*error;

    % -------- Back-propagation --------
    hidden_layer_error = weight2'*delta;
    delta1 = y1.*(1-y1).*hidden_layer_error;

    % -------- Raw weight adjustments (your rule) --------
    delta_weight1 = alpha*delta1*transposed_Input';
    delta_weight2 = alpha*delta*y1';

    % -------- Momentum update --------
    mmt1 = delta_weight1 + beta*mmt1;
    weight1 = weight1 + mmt1;

    mmt2 = delta_weight2 + beta*mmt2;
    weight2 = weight2 + mmt2;

end
end
