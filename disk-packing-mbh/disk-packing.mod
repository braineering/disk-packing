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
param RSTAR {i in NMin..NMax}; # optimal known values (Packomania)

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
subject to noOverlapping {i in 1..N, j in 1..N: i<j}: # Non overlapping disks
  (X[i]-X[j])**2 + (Y[i]-Y[j])**2 >= 4*(f**2);

subject to containerX_lb {i in 1..N}: # Disks within container (lower bound on disks center X coordinate)
  X[i] >= f;

subject to containerX_ub {i in 1..N}: # Disks within container (upper bound on disks center X coordinate)
  X[i] <= 1.0-f;

subject to containerY_lb {i in 1..N}: # Disks within container (lower bound on disks center Y coordinate)
  Y[i] >= f;

subject to containerY_ub {i in 1..N}: # Disks within container (upper bound on disks center Y coordinate)
  Y[i] <= 1.0-f;
