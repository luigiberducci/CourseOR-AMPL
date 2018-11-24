# Variables
var X_7_1;      # X_m_t := number of wood unit with lenght m and cut with method t
var X_7_2;
var X_7_3;
var X_7_4;
var X_7_5;
var X_3_1;
var X_3_2;
var Y_1_5;      # Y_m_d := number of wood unit with length m,d obtained after cuts
var Y_2;        # Y_m   := number of wood unit with length m obtained after cuts
var Y_4;

# Objective funciton
minimize cost: 5*(X_3_1 + X_3_2) + 10*(X_7_1 + X_7_2 + X_7_3 + X_7_4 + X_7_5);

# Constraints
# The number of wood unit of a given lenght is given by the unit of such lenght obtained by the various cut method
s.t. c_cut_consistency_Y_1_5: Y_1_5 = 4*X_7_2 + 2*X_7_3 + 2*X_7_5 + 2*X_3_2;
s.t. c_cut_consistency_Y_2:   Y_2   = 1*X_7_1 + 3*X_7_4 + 2*X_7_5 + 1*X_3_1;
s.t. c_cut_consistency_Y_4:   Y_4   = 1*X_7_1 + 1*X_7_3;

# To obtain a libraries stock, a certain number of resource are required
s.t. c_requirements_Y_1_5:    Y_1_5 >= 2500;
s.t. c_requirements_Y_2:      Y_2   >= 2000;
s.t. c_requirements_Y_4:      Y_4   >= 1500;

s.t. c_not_neg_X_7_1: X_7_1>=0;
s.t. c_not_neg_X_7_2: X_7_2>=0;
s.t. c_not_neg_X_7_3: X_7_3>=0;
s.t. c_not_neg_X_7_4: X_7_4>=0;
s.t. c_not_neg_X_7_5: X_7_5>=0;
s.t. c_not_neg_X_3_1: X_3_1>=0;
s.t. c_not_neg_X_3_2: X_3_2>=0;
s.t. c_not_neg_Y_1_5: Y_1_5>=0;
s.t. c_not_neg_Y_2:   Y_2>=0;
s.t. c_not_neg_Y_4:   Y_4>=0;
