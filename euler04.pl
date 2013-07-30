#!usr/bin/perl -w

my $max=0;
for $multiply1(100..999)
{
	for $multiply2(100..999){
		$Solution=$multiply1*$multiply2;
		$ReversedSolution=reverse $Solution;
						        
		if($ReversedSolution==$Solution) {
			if($Solution>$max){
				$max=$Solution;
			}
		}
	}
}
print "$max\n";
