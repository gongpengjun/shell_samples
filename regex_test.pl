#!/usr/local/bin/perl

# usage:
# echo "beforematchafter" | perl regex_test.pl

use strict;
use warnings;

while (<>) {
  chomp;
  if (/match/) {
    print "Matched: |$`<$&>$'|\n";
  } else {
    print "No match: |$_|\n"
  }
}

