#!/usr/bin/env python

l = range(4000,200000)
x = 0
total = 0

for i in l:
    x=0
    for f in str(i):
        x+=int(f)**5
    if x==i:
        total+=i

print total
