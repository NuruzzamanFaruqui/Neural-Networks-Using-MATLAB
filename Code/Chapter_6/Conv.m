function y = Conv(x, filter_Weight)
  [wrow, wcol, numFilters] = size(filter_Weight);
  [xrow, xcol, ~        ] = size(x);

  yrow = xrow - wrow + 1;
  ycol = xcol - wcol + 1;

  y = zeros(yrow, ycol, numFilters);

  for k = 1:numFilters
    filter = filter_Weight(:, :, k);
    filter = rot90(squeeze(filter), 2);
    y(:, :, k) = conv2(x, filter, 'valid');
  end
end
