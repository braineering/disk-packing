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
param NMax >= NMin; # maximum number of disks
param FSTAR {i in NMin..NMax}; # optimal values according to Packomania

#===============================================================================
# DECISION VARIABLES
#===============================================================================
var X {i in 1..N} >=0, <=1; # disks center (X coordinate)
var Y {i in 1..N} >=0, <=1; # disks center (Y coordinate)
var f <= 1;                 # disks distance

#===============================================================================
# OBJECTIVE
#===============================================================================
maximize distance: f; # maximize distance

#===============================================================================
# BOUNDS
#===============================================================================
subject to minDistance {i in 1..N, j in 1..N: j>i}: # distance bound
  (X[i]-X[j])**2 + (Y[i]-Y[j])**2 >= f**2;
