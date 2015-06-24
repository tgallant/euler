#/usr/bin/env python

import math
import itertools

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

def rotate(x):
    rl=[x]
    y=1
    while y<len(str(x)):
        x=str(x)[1:] + str(x)[0]
        rl.append(int(x))
        y+=1
    return rl
    
num=0
total=0
for i in range(1,1000000):
    if prime(i):
        num=0
        for g in list(rotate(i)):
            if prime(g):
                num=1
            else:
                num=0
                break
        if num==1:
            total+=1
print total
