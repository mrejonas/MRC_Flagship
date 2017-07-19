#!/usr/bin/perl -w

foreach $name(@ARGV){
	$patient = (split(/ /, $name))[0];
	open(IN, $name);
	$line = 0;
	@initial = "	";
	while(<IN>){
		$line++;
		chomp;
		@ar = split(/\t/);
		if($line == 8){ @initial = @ar[4..55]; }
		elsif($line > 8){
			@ar3 = @ar[4..55];
			for($i = 0; $i == $#ar3; $i++){
				$initial[$i] = $initial[$i] + $ar3[$i];
			}
		}else{ next; }
	}
	print "$patient @initial\n";
}