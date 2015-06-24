#!/usr/bin/env python

l=0
n=str()
while len(n)<=1000000:
    n+=str(l)
    l+=1
print int(n[1])*int(n[10])*int(n[100])*int(n[1000])*int(n[10000])*int(n[100000])*int(n[1000000])
