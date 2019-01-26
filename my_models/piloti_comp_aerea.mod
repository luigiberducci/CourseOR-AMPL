# Variabili
# E[i] is integer to force that the number of expert pilots takes the upper part of X[i]/5. 
# As a result, since E is a redundant variable, it forces all the variables to be integer, as desired.
var X {i in 1..5};
var E {i in 1..5} integer;  

# Funzione obiettivo
minimize cost : 1000000 * (2 * (sum {i in 1..5} X[i]) + 5 * (sum {i in 1..5} E[i]));

# Vincoli
# Consistenza piloti nuovi e esperti
s.t. c_cons_0 : X[5] = 0;
s.t. c_cons_1 : E[1] = 90;
s.t. c_cons_2 : E[2] = E[1] + X[2];
s.t. c_cons_3 : E[3] = E[2] + X[3];
s.t. c_cons_4 : E[4] = E[3] + X[4];
s.t. c_cons_5 : E[5] = E[4] + X[5];

# Ordine esperti per servizio regolare
s.t. c_ordine_1 : E[1] - (X[1]/5) >= 80;
s.t. c_ordine_2 : E[2] - (X[2]/5) >= 90;
s.t. c_ordine_3 : E[3] - (X[3]/5) >= 110;
s.t. c_ordine_4 : E[4] - (X[4]/5) >= 120;
s.t. c_ordine_5 : E[5] - (X[5]/5) >= 110;   # Recal that by c_cons_0, X[5] is 0

# Limite nuovi piloti
s.t. c_limit_new_pilots {i in 1..5} : X[i] <= 15;

# Non negatività delle variabili
s.t. not_neg_1 {i in 1..5} : X[i]>=0; 
s.t. not_neg_2 {i in 1..5} : E[i]>=0; 
