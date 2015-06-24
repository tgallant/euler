#!/usr/bin/env python

first = 0
second = 1
nextnum = 0
i = 1

while True:
    nextnum = first + second
    first = second
    second = nextnum
    i+=1
    if len(str(nextnum)) == 1000:
        print i
        break

