#!/usr/bin/env python
import sys
#import re
#import math

# This script will take time-stamped data and determine
# the where the slope of a graph changes.
#x = math.atan(29/10)
#print math.degrees(x)

filename = sys.argv[1]
#formname = sys.argv[2]

with open(filename) as f:
    for line in f:
        fields = line.split(",")
        print fields[2], fields[3]
