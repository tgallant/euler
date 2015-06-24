#!/usr/bin/env python

l=set(x*(3*x-1)/2 for x in xrange(1,2500))
for i in l:
    for j in l:
        if i>j and i+j in l and abs(i-j) in l:
            print abs(i-j)
