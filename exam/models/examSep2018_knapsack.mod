# Variables
var X {i in 1..7} binary;

# Objective Function
maximize gain: 1*X[1] + 6*X[2] + 7*X[3] + 0.8*X[4] + 4*X[5] + 1.4*X[6] + 0.9*X[7];

# Constraints
s.t. limit_budget: - X[1] + 2*X[2] + 4*X[3] + X[4] + 2*X[5] + 2*X[6] + 2*X[7] <= 5;
