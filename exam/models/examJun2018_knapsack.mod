# Variables
var X {i in 1..7} binary;

# Objective Function
maximize gain: X[1] + 1.2*X[2] - X[3] + 2.1*X[4] + X[5] + 5*X[6] + 2.4*X[7];

# Constraints
s.t. limit_budget: X[1] + X[2] + 3*X[3] + 2*X[4] - X[5] + 3*X[6] + 2*X[7] <= 4;
