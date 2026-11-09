function confusion = Multiclass_Confusion(actual, predicted, number_Of_Classes)
  confusion = zeros(number_Of_Classes, number_Of_Classes);

  for k = 1:length(actual)
    confusion(actual(k), predicted(k)) = confusion(actual(k), predicted(k)) + 1;
  end
end
