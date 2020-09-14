#!/usr/local/bin/perl

use strict;
use warnings;

my $names = 'Fred Flintstone and Wilma Flintstone';

if ( $names =~ m/(?<last_name>\w+) and \w+ \g{last_name}/ ) {
	print "I saw $+{last_name}\n";
	#say "I saw $+{last_name}"; # needs `use 5.010`
}
