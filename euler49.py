#!/usr/bin/env python

import itertools
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


for i in range(2000,3000):
    l=[]
    c=[]
    b=0
    if str(0) in str(i):
        continue
    if prime(i):
        for j in str(i):
            l.append(j)
        for f in list(itertools.permutations(l)):
            m=(''.join(map(str,f)))
            if prime(int(m)):
                c.append(int(m))
        c=sorted(c)
        for n in c:
            for x in c:
                if x==n:
                    continue
                if x>n:
                    y=x-n
                    if n+y and n+2*y in c:
                        print n, n+y, n+2*y, y
                        break
