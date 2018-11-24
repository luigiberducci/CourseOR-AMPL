num_workers = 0
num_free_workers = 0
num_shifts  = 0
num_blocked_shifts = 0
num_free_shifts = 0

def encodeShift(d,t):
    return str(d) + "_" + str(t)

def printWORKER():
    global num_workers
    global num_free_workers
    global num_blocked_shifts
    print "set WORKER := "
    for w in worker:
        if min_tsk.get(w)!=None:
            num_blocked_shifts = num_blocked_shifts + min_tsk.get(w)
        else:
            num_free_workers = num_free_workers + 1
        if min_tsk.get(w)==0:
            continue
        print w
        num_workers = num_workers + 1
    print ";"

def printTASK():
    global num_shifts
    global num_free_shifts
    print "set TASK := "
    for d in range(first_day, last_day+1):
        if d in holidays:
            continue
        for t in range(1,tsk_x_day+1):
            print encodeShift(d,t)
            num_shifts = num_shifts + 1
    num_free_shifts = num_shifts - num_blocked_shifts
    print ";"

def printCOST():
    print "param cost := "
    for w in worker:
        if min_tsk.get(w)==0:
            continue
        for d in range(first_day, last_day+1):
            if d in holidays:
                continue
            for t in range(1, tsk_x_day+1):
                print w + " " + encodeShift(d,t) + " 1"
    print ";"

def printNUMWRK():
    print "param min_num_wrk :="
    for d in range(first_day, last_day+1):
        if d in holidays:
            continue
        for t in range(1,tsk_x_day+1):
            print encodeShift(d,t) + " 1"
    print ";"

def printMINTSK():
    print "param min_num_tsk :="
    for w in worker:
        if min_tsk.get(w)==0:
            continue
        if min_tsk.get(w)==None:
            print w + " " + str(num_free_shifts/num_free_workers)
        else:
            print w + " " + str(min_tsk.get(w))
    print ";"

def printAVAIL():
    print "param avail :="
    for w in worker:
        if min_tsk.get(w)==0:
            continue
        for d in range(first_day, last_day+1):
            if d in holidays:
                continue
            for t in range(1,tsk_x_day+1):
                print w + " " + encodeShift(d,t) + " 1"
    print ";"

worker  = [ "Stud1", "Stud2", "Stud3", "Stud4", "Stud5",
            "Stud6", "Stud7", "Stud8", "Stud9", "Stud10",
            "Stud11", "Stud12", "Stud13", "Stud14", "Stud15" ]

min_tsk = {}

first_day   = 1
last_day    = 11
tsk_x_day   = 3
holidays    = []

printWORKER()
printTASK()
printCOST()
printNUMWRK()
printMINTSK()
printAVAIL()

print "#=========================================="
print "#             FINAL REPORT"
print "#=========================================="
print "# Num Workers:\t\t" + str(num_workers)
print "# Num Free Workers:\t" + str(num_free_workers)
print "# Num Shifts:\t\t" + str(num_shifts)
print "# Num Blocked Shifts:\t" + str(num_blocked_shifts)
print "# Num Free Shifts:\t" + str(num_free_shifts)
print "#=========================================="
