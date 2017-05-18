#===============================================================================
# DISK PACKING (Model)
#
# Maximize the radius and number of non-overlapping disks in the unit square.
#===============================================================================
reset;

#===============================================================================
# PARAMETERS
#===============================================================================
param N >= 0; # Number of disks

#===============================================================================
# DECISION VARIABLES
#===============================================================================
var X {i in 1..N} := Uniform(0,1), >=0, <=1; # Disks center (X coordinate)
var Y {i in 1..N} := Uniform(0,1), >=0, <=1; # Disks center (Y coordinate)
var r             := Uniform(0,1), >=0, <=1; # Disks radius

#===============================================================================
# OBJECTIVE
#===============================================================================
maximize f: r; # Maximize disks radius

#===============================================================================
# BOUNDS
#===============================================================================
subject to noOverlapping {i in 1..N, j in 1..N: j>i}: # Non overlapping disks
  (X[i]-X[j])**2 + (Y[i]-Y[j])**2 <= 4*(r**2);

subject to containerX_lb {i in 1..N}: # Disks within container (lower bound on disks center X coordinate)
  r <= X[i];

subject to containerX2_ub {i in 1..N}: # Disks within container (upper bound on disks center X coordinate)
  X[i] <= 1-r;

subject to containerY_lb {i in 1..N}: # Disks within container (lower bound on disks center Y coordinate)
  r <= Y[i];

subject to containerY2_ub {i in 1..N}: # Disks within container (upper bound on disks center Y coordinate)
  Y[i] <= 1-r;
