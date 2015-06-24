#!/usr/bin/env python

import math

def prime(x):
    if x==1:
        return 0
    elif x<4:
        return 1
    elif x%2==0:
        return 0
    elif x<9:
        return 1
    elif x%3==0:
        return 0
    else:
        r = math.sqrt(x)
        f = 5
        while f<=r:
            if x%f==0:
                return 0
                break
            if x%(f+2)==0:
                return 0
                break
            f=f+6
    return 1

sum=0

for i in range(10,1000000):
    if prime(i):
        l = len(str(i))
        x=0
        while(x<l):
            if prime(int(str(i)[x:])):
                x+=1
            else:
                break
        y=1
        while(y<l):
            n = str(i)[:-y]
            if prime(int(n)):
                y+=1
            else:
                break
        if x==l and y==l:
            sum+=i

print sum
        
