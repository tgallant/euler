#!/usr/bin/env perl -w
use strict;

my $number = 600851475143;
my $divisor = 2;

while($number > 1) {   
	if(0==($number % $divisor)) {
		$number /= $divisor;
		$divisor--;
	}
	$divisor++;
}

print "$divisor\n"
