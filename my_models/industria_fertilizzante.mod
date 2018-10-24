# Variables
var X;      # X:=tons produced
var Z;      # Z:=tons bought from the other farm
var Y_1;    # Y_i:=tons of i-th component bought
var Y_2;
var Y_3;
var Y_4;

# Objective function
# minimize the costs, remember that there are 200 tons of component C2 already available in the stock (then no cost for them)
minimize costs: 120*Y_1 + 135*(Y_2-200) + 140*Y_3 + 180*Y_4 + 185*Z;

# Constraints
s.t. c_order: X+Z=10000; # Order of exactly 10000 tons

# Each component has a percentage of azoto and it must be at least 4% of product
s.t. c_azoto: 0.54*Y_1 + 0.10*Y_2 + 0.20*Y_3 + 0.15*Y_4 >= 0.4*X;
# Each component has a percentage of fosforo and it must be at least 15% of product
s.t. c_fosforo: 0.10*Y_1 + 0.45*Y_2 + 0.05*Y_3 + 0.20*Y_4 >= 0.15*X;
# Each component has a percentage of potassio and it must be at least 18% of product
s.t. c_potassio: 0.03*Y_1 + 0.13*Y_2 + 0.38*Y_3 + 0.17*Y_4 >= 0.18*X;

# Not negative variables
s.t. not_neg_X: X>=0;
s.t. not_neg_Z: Z>=0;
s.t. not_neg_Y1: Y_1>=0;
s.t. not_neg_Y2: Y_2>=200;  # Because there are 200 tons in the stock
s.t. not_neg_Y3: Y_3>=0;
s.t. not_neg_Y4: Y_4>=0;
