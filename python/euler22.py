#!/usr/bin/env python

total=0
name=0
y=0
#namesfile=open("testnames.txt")
lines = [i.strip() for i in open("names.txt").readlines()]
#lines = [i for i in namesfile.readlines()]
lines.sort()
for x in lines:
    y+=1
    for c in x:
        name+=ord(c)%32
    total+=name*y
    name=0
print total
