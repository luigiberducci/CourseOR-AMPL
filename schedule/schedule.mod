# Parameter
set WORKER;
set TASK;

# Cost of assignment of task tsk to worker op
param cost  {w in WORKER, tsk in TASK};

# Number of worker needed for each task
param min_num_wrk {tsk in TASK};

# Minimum number of tasks for each worker
param min_num_tsk {w in WORKER};

# Availability of worker for task
param avail {w in WORKER, tsk in TASK} binary;

# Variables
var X {w in WORKER, tsk in TASK} binary >= 0;

# Objective function : minimize the overall cost
minimize tot_cost : sum {w in WORKER, tsk in TASK} cost[w, tsk]*X[w, tsk] ;

# Constraints
# Assign exactly 1 task for each worker
s.t. row_constr {w in WORKER} : sum {tsk in TASK} X[w, tsk] >= min_num_tsk[w];

# Assign a task to only 1 worker
s.t. col_constr {t in TASK} : sum {w in WORKER} avail[w, t]*X[w, t] = min_num_wrk[t];
