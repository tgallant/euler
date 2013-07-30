#!/usr/bin/env python

import re

def noduplicates(x):
    if '0' in str(x):
        return False
    for i in range(1,10):
        total=0
        for m in re.finditer(str(i),str(x)):
            total+=1
        if total>1:
            return False
    return True
        
maxi=0
for i in range(9000,10000):
    n=1
    b=str()
    while True:
        b+=str(i*n)
        if noduplicates(b):
            if int(b)>maxi:
                maxi=int(b)
            n+=1
        else:
            break
print maxi
