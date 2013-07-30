#!/usr/bin/env python

for i in range(10,100):
    x=str(i)
    for j in range(i,100):
        y=str(j)
        if i%10==0 or j%10==0 or i>=j:
            continue
        else:
            if x[1] == y[0]:
                if int(x[0])/float(y[1]) == int(i)/float(j):
                    print i,j
