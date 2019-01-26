# Variables
var X {i in 1..4};

# Objective Function
minimize of: - X[1] - 5*X[2] + 4*X[3] + 2*X[4];

# Constraints
s.t. c1: 3*X[1] - X[2] + 2*X[3] - 3*X[4] = 4;
s.t. c2: - X[1] + 2*X[2] + X[3] + 4*X[4] = 6;

s.t. non_neg {i in 1..4}: X[i] >= 0;
