while (<>) {
  chomp;
  my $json_string = $_;
  print "original json string:$json_string\n";
  $json_string =~ s/\'/`/g;
  $pretty_json_string = `jq -n '$json_string'`;
  print "replaced json string:$json_string\n";
  print "pretty   json string:$pretty_json_string\n";
}
