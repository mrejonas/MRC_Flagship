#!/usr/bin/perl -w

use Math::Trig;
#@time ; @ppm ;
$turn = 0 ;
while(<>){
	if($turn == 0){ chomp ; $header = $_ ; $turn = 1 ; }
	else{
		@ar = split(/,/,$_) ;
		push(@time, $ar[2]) ;
		push(@ppm, $ar[3]) ;
	}
}

for($i=0 ;$i<scalar(@time) ;$i++){
	$slope = ($ppm[$i+1] - $ppm[$i])/10 ;
	print "$slope\t",atan($slope),"\n" ;
}