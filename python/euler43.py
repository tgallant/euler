#!/usr/bin/env python

import itertools

sums=0
l=list(itertools.permutations(range(0,10)))
for i in l:
    m=''.join(map(str,i))
    if int(m[1:4])%2==0 and int(m[2:5])%3==0 and int(m[3:6])%5==0 and int(m[4:7])%7==0 and int(m[5:8])%11==0 and int(m[6:9])%13==0 and int(m[7:10])%17==0:
        sums+=int(m)
print sums
