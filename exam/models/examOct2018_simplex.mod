# Variables
var X {i in 1..5};

# Objective Function
minimize of: 10*X[1] - X[2] + 4*X[3] + 20*X[4];

# Constraints
s.t. c1: X[1] + 4*X[2] - 2*X[3] + X[5] = 1;
s.t. c2: -2*X[1] + X[3] + X[4] - 7*X[5] = -2;

s.t. non_neg {i in 1..4}: X[i] >= 0;
