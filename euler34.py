#!/usr/bin/env python

def factorial(x):
    j=1
    for i in range(1,x+1):
        j*=i
    return j

total=0
full=0

for i in range(3,41000):
    total=0
    for j in str(i):
        for f in j:
            total+=factorial(int(j))
        if total == i:
            full+=total
print full
