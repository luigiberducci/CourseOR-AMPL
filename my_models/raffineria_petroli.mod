# Variables
var X_1;    # X_i := number of unit of i-th product produced
var X_2;
var X_3;
var Y_1;    # Y_j := number of unit of j-th petroil bought
var Y_2;

# Objective Function
minimize costs: 20*Y_1 + 15*Y_2;

# Constraints
# The quantity of j-th petroil bought is used for the production of products
s.t. c_def_petroil1: Y_1 = 0.4*X_1 + 0.2*X_2 + 0.3*X_3;
s.t. c_def_petroil2: Y_2 = 0.3*X_1 + 0.4*X_2 + 0.2*X_3;
# Limited resources
s.t. c_limit_petroil1: Y_1<=6000;
s.t. c_limit_petroil2: Y_2<=6000;
# Daily order
s.t. c_order_P1: X_1>=2000;
s.t. c_order_P2: X_2>=1500;
s.t. c_order_P3: X_3>=500;
