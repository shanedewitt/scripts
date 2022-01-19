#!/usr/bin/perl
#
# nodesniffer.pl
#
# show count of node processings running per ip
#
if ($<) {
  die "Error: exiting $0 as not executed by root\n";
}

$cmd = "netstat -tnp";
open(PIPE, "$cmd |");
<PIPE>;<PIPE>;
while(<PIPE>) {
  ($faddress,$data) = (split)[4,6];
  ($faddress) = (split(/:/,$faddress))[0];
  ($pid,$prg) = (split(/\//,$data));
  if($prg eq "node") {
    $hash{"$faddress"} += 1;
  }
}
close(PIPE);
@keys = sort { $hash{$a} <=> $hash{$b} } keys %hash;
foreach $k (reverse @keys) {
  $cmd = "nslookup $k | grep name";
  open(PIPE,"$cmd |");
  chomp($name = (split(/=/,<PIPE>))[1]);
  if($@) { $name = "unknown"; }
  print "$name ($k) has " . $hash{$k} . " node(s) running\n";
  close(PIPE);
}
