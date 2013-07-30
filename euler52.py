#!/usr/bin/env python

import itertools

n=0
for i in range(1000,10000):
    l=[]
    c=[]
    if str(0) in str(i):
        continue
    for j in str(i):
        l.append(j)
        for f in list(itertools.permutations(l)):
            m=(''.join(map(str,f)))
            c.append(int(m))
        c=sorted(c)
        for n in c:
            if 2*n and 3*n and 4*n and 5*n and 6*n in c:
                print n
                break
