# Variables
var X_1;        #X_i := tons of product to produce and sell in the i-th week
var X_2;
var Y_1_1;      #Y_i_j := tons of j-th ingredient to buy at the beginning of the i-th week
var Y_1_2;
var Y_1_3;
var Y_2_1;
var Y_2_2;
var Y_2_3;
var M_1;        #M_j := tons of j-th ingredient to store at the end of first week
var M_2;
var M_3;
var M_p;        #M_p := tons of product to produce and store at the end of first week

# Objective function
# profit := gain_1week + gain_2week - (cost_ingredients_1week + cost_ingredients_2week) - cost_storing
maximize profit: 1200*(X_1) + 1000*(X_2+M_p) - 1000*(0.6*Y_1_1 + 0.5*Y_1_2 + 0.75*Y_1_3 + 0.7*Y_2_1 + 0.5*Y_2_2 + 0.7*Y_2_3) - 200*(M_p + M_1 + M_2 + M_3);

# Constraints
# Produce at least 5 tons in the 1st week and at most 10 tons
s.t. c_min_prod_w1: X_1+M_p>=5;
s.t. c_max_prod_w1: X_1+M_p<=10;
# Produce at least 7 tons in the 2nd week and at most 10 tons
s.t. c_min_prod_w2: X_2>=7;
s.t. c_max_prod_w2: X_2<=10;
# Produce exactly 13 tons in the all period
s.t. c_exact_tot_prod: X_1 + M_p + X_2=13;

# Upperbound ingredients in 1st week
s.t. c_max_i1_w1: Y_1_1<=10;
s.t. c_max_i2_w1: Y_1_2<=60;
s.t. c_max_i3_w1: Y_1_3<=100;
# Upperbound ingredients in 2nd week
s.t. c_max_i1_w2: Y_2_1<=4;
s.t. c_max_i2_w2: Y_2_2<=8;
s.t. c_max_i3_w2: Y_2_3<=100;

# Blend composition
# The ingredients bought in the 1st week are used to produce the blend or stored
s.t. c_ingredients_prod_w1: Y_1_1-M_1 + Y_1_2-M_2 + Y_1_3-M_3 = X_1+M_p;
# The ingredients bought in the 2nd week minus the one stored are used to produce the blend in the 2nd week
s.t. c_ingredients_prod_w2: Y_2_1+M_1 + Y_2_2+M_2 + Y_2_3+M_3 = X_2;
# Other constraints on percentage
s.t. c_blend_i1_w1: Y_1_1-M_1<=0.40*(X_1+M_p);
s.t. c_blend_i2_w1: Y_1_2-M_2<=0.38*(X_1+M_p);
s.t. c_blend_i3_w1: Y_1_3-M_3>=0.25*(X_1+M_p);
s.t. c_blend_i1_w2: Y_2_1+M_1<=0.40*X_2;
s.t. c_blend_i2_w2: Y_2_2+M_2<=0.38*X_2;
s.t. c_blend_i3_w2: Y_2_3+M_3>=0.25*X_2;

# Not negative variables
s.t. c_not_neg_x1: X_1>=0;
s.t. c_not_neg_x2: X_2>=0;
s.t. c_not_neg_i1_w1: Y_1_1>=0;
s.t. c_not_neg_i2_w1: Y_1_2>=0;
s.t. c_not_neg_i3_w1: Y_1_3>=0;
s.t. c_not_neg_i1_w2: Y_2_1>=0;
s.t. c_not_neg_i2_w2: Y_2_2>=0;
s.t. c_not_neg_i3_w2: Y_2_3>=0;
s.t. c_not_neg_i1_store: M_1>=0;
s.t. c_not_neg_i2_store: M_2>=0;
s.t. c_not_neg_i3_store: M_3>=0;
s.t. c_not_neg_p_store: M_p>=0;
