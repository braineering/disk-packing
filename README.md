# DISK PACKING

*Disk packing problem, leveraging AMPL and Matlab.*

*Coursework in Optimization Models for Big Data 2016/2017*

The disk packing problem is a well-known NP-hard problem.
It consists in the maximization of the radius and number of non-overlapping disks in the unit square.
In this work, we propose two equivalent formulation of the disk packing problem.

## Usage
Run the standard formulation:

  $disk-packing> ampl disk-packing.run

View the output:

  $disk-packing> cat out/out-[N]\_res.txt

where *[N]* is the number of disks.

Visualize the result executing the Matlab script `disk-packing/disk-packing.m`.

Run the equivalent formulation:

  $disk-packing-equiv> ampl disk-packing-equiv.run

View the output:

  $disk-packing-equiv> cat out/out-[N]\_res.txt

where *[N]* is the number of disks.

Visualize the result executing the Matlab script `disk-packing-equiv/disk-packing-equiv.m`.

## Authors
Giacomo Marciani, [gmarciani@acm.org](mailto:gmarciani@acm.org)

Michele Porretta, [mporretta@acm.org](mailto:mporretta@acm.org)

## License
The project is released under the [MIT License](https://opensource.org/licenses/MIT).
