#!/usr/bin/env python

import itertools

l = list(itertools.permutations(range(1,10)))

for i in l:
    f = ''.join(map(str,i))
    if int(f[0:2])*int(f[2:5])==int(f[5:]) or int(f[0:1])*int(f[1:5])==int(f[5:]):
        print int(f[5:])
    if int(f)>481597632:
        break
