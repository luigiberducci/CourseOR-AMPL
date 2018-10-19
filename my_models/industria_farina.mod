# Variables
var P_1;         # P_i := units produced by i-th Plant
var P_2;
var S_1_1;       # S_i_m := units sent by i-th Plant to m-th warehouse
var S_1_2;
var S_2_1;
var S_2_2;
var I_1;         # I_m := units sold in the m-th warehouse
var I_2;
var D_1_1;       # D_m_c := units sent by m-th warehouse to the c-th shop
var D_1_2;
var D_1_3;
var D_1_4;
var D_2_1;
var D_2_2;
var D_2_3;
var D_2_4;

# Objective function
# profit := gain - transport_to_warehouses - transport_to_shops
maximize profit: (350*(D_1_1+D_2_1) + 280*(D_1_2+D_2_2) + 200*(D_1_3+D_2_3) + 270*(D_1_4+D_2_4)) - (21*S_1_1 + 25*S_1_2 + 22*S_2_1 + 27*S_2_2) - (33*D_1_1 + 31*D_1_2 + 36*D_1_3 + 30*D_1_4 + 27*D_2_4  + 30*D_2_4  + 28*D_2_4  + 31*D_2_4 );

# Constraints
s.t. c_needs_D1: D_1_1 + D_2_1 >= 150;
s.t. c_needs_D2: D_1_2 + D_2_2 >= 190;
s.t. c_needs_D3: D_1_3 + D_2_3 >= 200;
s.t. c_needs_D4: D_1_4 + D_2_4 >= 170;

s.t. c_min_sale_M1: I_1 >= 550;
s.t. c_min_sale_M2: I_2 >= 550;

s.t. c_max_prod_I1: P_1 <= 3000;
s.t. c_max_prod_I2: P_2 <= 2000;

# All the units sent to i-th warehouse (by both plants) is sold there or sent to the shops
# I_i + D_i_1 + D_i_2 + D_i_3 + D_i_4 = S_1_i + S_2_i;
s.t. c_all_sent_or_sell1: I_1 + D_1_1 + D_1_2 + D_1_3 + D_1_4 = S_1_1 + S_2_1;
s.t. c_all_sent_or_sell2: I_2 + D_2_1 + D_2_2 + D_2_3 + D_2_4 = S_1_2 + S_2_2;

# All the units produced are sent to warehouses
s.t. c_all_P1_sent_to_wares: S_1_1 + S_1_2 = P_1;
s.t. c_all_P2_sent_to_wares: S_2_1 + S_2_2 = P_2;

s.t. c_not_neg_P1: P_1>=0;
s.t. c_not_neg_P2: P_2>=0;
s.t. c_not_neg_M1: I_1>=0;
s.t. c_not_neg_M2: I_2>=0;
s.t. c_not_neg_S11: S_1_1>=0;
s.t. c_not_neg_S12: S_1_2>=0;
s.t. c_not_neg_S21: S_2_1>=0;
s.t. c_not_neg_S22: S_2_2>=0;
s.t. c_not_neg_D11: D_1_1>=0;
s.t. c_not_neg_D12: D_1_2>=0;
s.t. c_not_neg_D13: D_1_3>=0;
s.t. c_not_neg_D14: D_1_4>=0;
s.t. c_not_neg_D21: D_2_1>=0;
s.t. c_not_neg_D22: D_2_2>=0;
s.t. c_not_neg_D23: D_2_3>=0;
s.t. c_not_neg_D24: D_2_4>=0;
