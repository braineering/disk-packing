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
param NMin >= 2;    # minimum number of disks
param NMax >= NMin; # maximum number of disks
param FSTAR {i in NMin..NMax}; # optimal known values (Packomania)

#===============================================================================
# DECISION VARIABLES
#===============================================================================
var X {i in 1..N}; # disks center (X coordinate)
var Y {i in 1..N}; # disks center (Y coordinate)
var f;             # disks distance

#===============================================================================
# OBJECTIVE
#===============================================================================
maximize radius: f; # Maximize disks radius

#===============================================================================
# BOUNDS
#===============================================================================
subject to noOverlapping {i in 1..N, j in 1..N: j>i}: # Non overlapping disks
  (X[i]-X[j])**2 + (Y[i]-Y[j])**2 >= 4*(f**2);

subject to containerX_lb {i in 1..N}: # Disks within container (lower bound on disks center X coordinate)
  f <= X[i];

subject to containerX2_ub {i in 1..N}: # Disks within container (upper bound on disks center X coordinate)
  X[i] <= 1-f;

subject to containerY_lb {i in 1..N}: # Disks within container (lower bound on disks center Y coordinate)
  f <= Y[i];

subject to containerY2_ub {i in 1..N}: # Disks within container (upper bound on disks center Y coordinate)
  Y[i] <= 1-f;
