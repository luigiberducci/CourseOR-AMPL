# Parameter
set WORKER;
set TASK;

# Cost of assignment of task tsk to worker op
param cost  {w in WORKER, tsk in TASK};

# Number of worker needed for each task
param nw {tsk in TASK};

# Minimum number of tasks for each worker
param nt {w in WORKER};

# Availability of worker for task
param av {w in WORKER, tsk in TASK} binary;

# Variables
var X {w in WORKER, tsk in TASK} binary >= 0;

# Objective function : minimize the overall cost
minimize tot_cost : sum {w in WORKER, tsk in TASK} cost[w, tsk]*X[w, tsk] ;

# Constraints
# Assign exactly 1 task for each worker
s.t. row1 : sum {tsk in TASK} X[1, tsk] >= nt[1];
s.t. row2 : sum {tsk in TASK} X[2, tsk] >= nt[2];
s.t. row3 : sum {tsk in TASK} X[3, tsk] >= nt[3];

# Assign a task to only 1 worker
s.t. col1 : sum {w in WORKER} av[w, '1_1']*X[w, '1_1'] = nw['1_1'];
s.t. col2 : sum {w in WORKER} av[w, '1_2']*X[w, '1_2'] = nw['1_2'];
s.t. col3 : sum {w in WORKER} av[w, '1_3']*X[w, '1_3'] = nw['1_3'];
