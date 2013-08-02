#!/usr/bin/perl -w
use strict;

my $squaresum=0;
my $sumsquare=0;

for my $x(1...100) {
  $squaresum+=$x*$x;
}

for my $y(1...100) {
  $sumsquare+=$y;
}
my $total=$sumsquare*$sumsquare - $squaresum;

print "$total\n";
