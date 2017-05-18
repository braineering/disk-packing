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
param SHEET >= 0;    # Sheet area (m^2)
param SIDE  >= 0;    # Room side (m)
param HMIN  >= 0;    # Room minimum height (m)
param HMAX  >= 0;    # Room maximum height (m)

#===============================================================================
# DECISION VARIABLES
#===============================================================================
var x1 >= 0, <= SIDE;   # tank width (m)
var x2 >= 0;            # tank height (m)

#===============================================================================
# OBJECTIVE
#===============================================================================
maximize volume: (x1^2)*x2; # Tank volume (m^3)

#===============================================================================
# BOUNDS
#===============================================================================
subject to sheet_area:  # Available sheet area (m^2)
    x1^2+4*x1*x2=SHEET;
subject to room_height: # Available room height (m)
    x2<=(SIDE-x1)*(HMAX-HMIN)/SIDE+HMIN;
