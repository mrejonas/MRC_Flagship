#!/usr/bin/perl -w
foreach $file(@ARGV){
	open(IN, $file) ;
	$samplenumber = 0 ;
	@summation = "" ;
	while(<IN>){
		if(/Sample File/){ $samplefile = (split(/\t/, $_))[-1] ;}
		elsif(/Sample Time/){ $sampletime = (split(/\t/, $_))[-1] ;}
		elsif(/Density/){ $density = (split(/\t/, $_))[-1] ;}
		elsif(/Stokes Correction/){ $stokes = (split(/\t/, $_))[-1] ;}
		elsif(/Lower Channel/){ $lowerchannel = (split(/\t/, $_))[-1] ;}
		elsif(/Upper Channel/){ $upperchannel = (split(/\t/, $_))[-1] ;}
		elsif(/Date/){ @header = split(/\t/, $_) ;}
		else{
			@timepoints = (split(/\t/, $_))[0,4..55] ;
			shift(@timepoints) ; # Remove the sample number from the list
			$samplenumber++ ;
			for(){
				
			}
		}
	}
}
