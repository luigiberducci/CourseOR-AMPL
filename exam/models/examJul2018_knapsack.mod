# Variables
var X {i in 1..7} binary;

# Objective Function
maximize gain: 3*X[1] + 0.4*X[2] - 0.5*X[3] + 3.2*X[4] + 3.9*X[5] + 2*X[6] + 4*X[7];

# Constraints
s.t. limit_budget: X[1] + 2*X[2] + 2*X[3] + 2*X[4] + 3*X[5] + 2*X[6] + X[7] <= 5;
