#!/usr/bin/env python

def binar(k):
    if k==0:
        return 0
    if k==1:
        return 1
    return (k%2)+10 *binar(k/2)

sum=0
for i in range(1,1000000):
    n = binar(i)
    if str(i) == str(i)[::-1] and str(n) == str(n)[::-1]:
        sum+=i
print sum
