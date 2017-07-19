#!/usr/bin/perl -w
foreach $name(@ARGV){
	open(IN, $name);
	$line = 0;
	$patient = (split(/ /, $name))[0];
	while(<IN>){
		$line++;
		chomp;
		@ar = split(/\t/);
		if($line == 7){
			@headers = @ar[4..55];
			$headers[0] =~ s/\</lt/;
			print "@headers\n";
			foreach $head(@headers){ $hash{$head} = 0; }
		}
		if($line > 7){
			@ar3 = @ar[4..55];
			foreach $key(@headers){
		
			}
			print "@ar3\n";
		}else{ next; }
	}
}

sub array_indexer {
	my @array = qw( your array here );
	my $search = "array";
	
	my %index;
	@index{@array} = (0..$#array);
	my $index = $index{$search};
	print $index, "\n";
}
