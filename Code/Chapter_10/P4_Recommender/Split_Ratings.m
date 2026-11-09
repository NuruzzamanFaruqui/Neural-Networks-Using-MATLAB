clear all

rng(4);

ratings = dlmread('ratings.csv', ',');
[number_Of_Users, number_Of_Movies] = size(ratings);

known = find(ratings > 0);
order = known(randperm(length(known)));

number_Known    = length(known);
number_Validate = round(0.1*number_Known);
number_Test     = round(0.1*number_Known);

validation_Cells = order(1:number_Validate);
test_Cells       = order(number_Validate+1 : number_Validate+number_Test);
train_Cells      = order(number_Validate+number_Test+1 : end);

train_Ratings = zeros(size(ratings));
train_Ratings(train_Cells) = ratings(train_Cells);

train_Scaled = train_Ratings/10;
