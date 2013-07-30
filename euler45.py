#!/usr/bin/env python

l=set(x*(x+1)/2 for x in xrange(5000,70000))
m=set(x*(3*x-1)/2 for x in xrange(5000,70000))
n=set(x*(2*x-1) for x in xrange(5000,70000))
for i in l:
    if i in m and i in n:
        print i
