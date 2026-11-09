Training_Weather;

predicted = (weight2*ReLU(weight1*test_Input'))'*spread_Target + average_Target;
actual    = test_Output*spread_Target + average_Target;

MAE  = mean(abs(actual - predicted));
RMSE = sqrt(mean((actual - predicted).^2));

yesterday     = max_Temp(target_Day(test_Index) - 1);
persistence   = mean(abs(actual - yesterday));

week_Average  = mean(max_Temp(target_Day(test_Index) - (1:7)), 2);
week_MAE      = mean(abs(actual - week_Average));

fprintf('Stopped at epoch %d, best epoch %d\n', stopped_Epoch, best_Epoch);
fprintf('Tomorrow = today:           MAE = %.2f deg C\n', persistence);
fprintf('Tomorrow = last 7 days avg: MAE = %.2f deg C\n', week_MAE);
fprintf('Neural network:             MAE = %.2f deg C   RMSE = %.2f\n', MAE, RMSE);
