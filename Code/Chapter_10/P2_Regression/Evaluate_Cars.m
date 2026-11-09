Training_Cars;

predicted = (weight2*ReLU(weight1*test_Input'))'*spread_Mpg + average_Mpg;
actual    = test_Output*spread_Mpg + average_Mpg;

error = actual - predicted;
MAE   = mean(abs(error));
RMSE  = sqrt(mean(error.^2));
R2    = 1 - sum(error.^2)/sum((actual - mean(actual)).^2);

baseline_Error = actual - (mean(train_Output)*spread_Mpg + average_Mpg);
baseline_MAE   = mean(abs(baseline_Error));

linear_Weight = pinv(train_Input) * train_Output;
linear_Output = (test_Input*linear_Weight)*spread_Mpg + average_Mpg;
linear_Error  = actual - linear_Output;
linear_MAE    = mean(abs(linear_Error));
linear_RMSE   = sqrt(mean(linear_Error.^2));
linear_R2     = 1 - sum(linear_Error.^2)/sum((actual - mean(actual)).^2);

fprintf('Stopped at epoch %d, best epoch %d\n', stopped_Epoch, best_Epoch);
fprintf('Baseline (always the average): MAE = %.2f mpg\n', baseline_MAE);
fprintf('Linear regression:  MAE = %.2f  RMSE = %.2f  R2 = %.3f\n', linear_MAE, linear_RMSE, linear_R2);
fprintf('Neural network:     MAE = %.2f  RMSE = %.2f  R2 = %.3f\n', MAE, RMSE, R2);
