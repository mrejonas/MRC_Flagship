#!/usr/bin/perl -w
use Number::Format ;

$/ = "V\n\r";
foreach $file(@ARGV){
	$out = $file;
	$out =~ s/txt/csv/;
	open(OUT, ">>$out");
	open(IN, $file);
	while(<IN>){
		s/\r\n/\t/g; s/\n\r/\t/;
		s/^\t //g; s/\t /\t/;
		s/\n\r/\n/; s/ +\t//;
		s/\t /\t/g;
		@arr = split(/\t/, $_);
		if(($#arr == 6) && ($arr[0] =~ /Z 0/)){ print OUT; }
	}
	close(IN);
	close(OUT);
}