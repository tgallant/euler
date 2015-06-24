#!/usr/bin/env python

j=1
for i in range(1,100):
    j*=i
ans = sum([int(i) for i in str(j)])
print ans
