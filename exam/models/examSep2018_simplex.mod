# Variables
var X {i in 1..3};

# Objective Function
minimize of: - X[1] - X[2] + X[3];

# Constraints
s.t. c1: X[1] - 4*X[2] + X[3] >= 1;
s.t. c2: X[1] - X[2]   - 2*X[3] >= 0;

s.t. non_neg {i in 1..3}: X[i] >= 0;
