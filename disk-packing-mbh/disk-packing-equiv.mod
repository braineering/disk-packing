#===============================================================================
# DISK PACKING (Model)
#
# Find the positions of N points inside the unit square
# in such a way that their minimum pairwise distance d is maximized.
#===============================================================================
reset;

#===============================================================================
# PARAMETERS
#===============================================================================
param N >= 0;    # current number of disks
param NMin >= 2; # minimum number of disks
param NMax >= 2; # maximum number of disks
param FSTAR {i in NMin..NMax}; # optimal values according to Packomania

#===============================================================================
# DECISION VARIABLES
#===============================================================================
var X {i in 1..N} >=0, <=1; # Disks center (X coordinate)
var Y {i in 1..N} >=0, <=1; # Disks center (Y coordinate)
var f <= 1; # Disks distance

#===============================================================================
# OBJECTIVE
#===============================================================================
maximize distance: f; # Maximize distance

#===============================================================================
# BOUNDS
#===============================================================================
subject to noMinOfd {i in 1..N, j in 1..N: j>i}:
  sqrt((X[i]-X[j])**2 + (Y[i]-Y[j])**2) >= f;
