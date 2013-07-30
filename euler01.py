#!/usr/bin/env python

import time

total = 0

start = time.time()

for x in range(1,1000):
    if x%3==0 or x%5==0:
        total+=x

elapsed = time.time() - start
print total
print elapsed
