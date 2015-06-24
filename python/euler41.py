#!/usr/bin/env python

import itertools
import math

def prime(x):
    if x==1:
        return False
    elif x<4:
        return True
    elif x%2==0:
        return False
    elif x<9:
        return True
    elif x%3==0:
        return False
    else:
        r = math.sqrt(x)
        f = 5
        while f<=r:
            if x%f==0:
                return False
                break
            if x%(f+2)==0:
                return False
                break
            f=f+6
    return True

maxi=0
l=list(itertools.permutations(range(1,8)))
for i in l:
    m=''.join(map(str,i))
    if prime(int(m)):
        if int(m)>maxi:
            maxi=int(m)
print maxi
