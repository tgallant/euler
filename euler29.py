#!/usr/bin/env python

x = 1
l = []
li = []
for i in range(2,101):
    for j in range(2,101):
        l.append(i**j)

l = list(set(l))
l =sorted(l)

print len(l)
