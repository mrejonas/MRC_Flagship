#!/usr/bin/python
import sys
#import re
import math

filename = sys.argv[1]

turn = 0
times = []
ppm = []

with open(filename) as f:
    for line in f:
        fields = line.split(",")
        if(turn == 0):
            header = line
            turn = 1
        else:
            times.append(fields[2]) ;
            con = float(fields[3])
            ppm.append(con)

def stager():
    ave = 0
    for i in range(len(ppm)-1):
        print "hello"
    
def printwise():
    print "Time CO2_ppm Slope Radians Degrees"

    for i in range(len(times)-1):
        slope = (ppm[i+1] - ppm[i])/10
        slope = float(slope)
        radian_angle = math.atan(slope)
        print times[i], ppm[i], slope, radian_angle, math.degrees(slope)
