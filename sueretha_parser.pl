#!/usr/bin/perl -w

while(<>){
	chomp;
	@ar = split(/,/);
	if($ar[0]){
		$tag = $ar[0];
		$hash{$tag} = $ar[1].":".$ar[4];
	}else{
		$hash{$tag} .= ",".$ar[1].":".$ar[4];
	}
}

for (keys %hash){ print "$_\t$hash{$_}\n"; }