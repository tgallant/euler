#!/usr/bin/env python

first = 0
second = 1
net = 0
total = 0

for i in range(1,4000000):
    if i<=1:
        net = i
    else:
        net = first + second
        first = second
        second = net
    if net%2==0:
        total += net
print total
