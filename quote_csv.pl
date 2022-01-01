#!/usr/bin/perl

# usage
# quote_csv.pl < input > output

while($line = <>) {
    @columns = split(/,/,$line);
    foreach $col (@columns) {
	$col =~ tr/"'//;
	print "'" . $col . "',";
    }
    print "\n";
}
    
