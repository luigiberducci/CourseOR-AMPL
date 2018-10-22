# Variables
var X_1;    # X_i := number of chilograms of P_i produced
var X_2;
var X_3;
var X_4;
var Y_1;    # Y_i := number of chilograms of M_i to buy
var Y_2;
var Y_3;
var T;      # T   := total number of working hours

# Objective function
# of: gain - cost_materials - cost_working_hours;
maximize of: 1000*(2*X_1 + 2.5*X_2 + 4*X_3 + 3.5*X_4) - (10*Y_1 + 15*Y_2 + 20*Y_3) - 100*T;

# Constraints
# The quantity of M_i to buy is exactly the quantity needed for produce the products
s.t. c_material1: Y_1 = 2*X_1 + 6*X_2 + 7*X_3 + 9*X_4;
s.t. c_material2: Y_2 = 10*X_1 + 20*X_2 + 2*X_3 + 7*X_4;
s.t. c_material3: Y_3 = 4*X_1 + 3*X_2 + 20*X_3 + 10*X_4;

# Limited resources
s.t. c_limited_material1: Y_1<=3000;
s.t. c_limited_material2: Y_2<=2000;
s.t. c_limited_material3: Y_3<=5000;

# Link consistency T
s.t. c_consistency_T: T = 10*X_1 + 15*X_2 + 20*X_3 + 18*X_4;

# Hours to produce P2 are up to 30% of total hours
s.t. c_hours_P2: 12*X_2<=0.30*T;

# Not negativity
s.t. c_not_neg_X_1: X_1>=0;
s.t. c_not_neg_X_2: X_2>=0;
s.t. c_not_neg_X_3: X_3>=0;
s.t. c_not_neg_X_4: X_4>=0;
s.t. c_not_neg_Y_1: Y_1>=0;
s.t. c_not_neg_Y_2: Y_2>=0;
s.t. c_not_neg_Y_3: Y_3>=0;
s.t. c_not_neg_T: T>=0;
