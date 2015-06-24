#!/usr/bin/env python

c=0
x=0
newarr=[]

def abund(x):
    z=0
    for i in range(1,x):
        if x % i ==0:
            z=z+i
    if z>x:
        return 0
    else:
        return 1

for i in range(1,28123):
    if abund(i)==0:
        print i
