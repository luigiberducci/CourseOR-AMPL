# Variables
var X {i in 1..7} binary;

# Objective Function
maximize of: 2.4*X[1] + 2*X[2] - X[3] + 0.2*X[4] + 5*X[5] + 3.6*X[6] + 4.2*X[7];

# Constraints
s.t. c1: X[1] + 2*X[2] + X[3] +  2*X[4] + X[5] + 2*X[6] + 3*X[7] <= 5;
