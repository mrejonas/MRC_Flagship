#!/usr/bin/perl
# Usage: scriptname -filetype filelist

use warnings ;
$filetype = shift(@ARGV) ;
$filetype = uc($filetype) ;

foreach $filename (@ARGV){
	if($filetype eq "APS"){ APS($filename) ; }
	elsif($filetype eq "CO2"){ CO2($filename) ; }
}

sub APS {
	my $file = shift(@_) ;
	my $patient_id = (split(/\s/, $file))[0] ;
	my $patient_id = lc($patient_id)._arm_1 ;
	open(IN,$file) ;
	while($timepoint = <IN>){
		if($timepoint =~ /Sample|Stokes|Channel|Density/){ next ; }
		my @particles = split(/\t/, $timepoint) ;
		splice(@particles,1,0,$patient_id) ; $arstr = join(",", @particles) ;
		my $arstr =~ s/^,// ;
		print "$arstr" ;
	}
	close(IN);
}

sub CO2 {
	$patient_id = (split(/\s/, $file))[0] ;
	$patient_id = lc($patient_id)._arm_1 ;
	open(IN, $file) ;
	while($timepoint = <IN>){
		if($timepoint =~ /DATE/){ next ; }
		$timepoint =~ s/\s+//g ;
		@co2_ppm = split(/,/ , $timepoint) ;
		@co2_ppm2 = "" ;
		for($i = 0 ; $i < 8 ; $i++){
			push(@co2_ppm2, $co2_ppm[$i]) ;
		}
		splice(@co2_ppm2, 2, 0, $patient_id) ;
		$arstr = join(",", @co2_ppm2) ;
		$arstr =~ s/^,// ;
		print "$arstr\n" ;
	}
	close(IN) ;
}