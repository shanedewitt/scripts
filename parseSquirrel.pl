#!/usr/bin/perl -w

# This script parses squirrel csv output to get columns and types to make a mysql table.

$cnt=0;
while ($line = <>) {
	($col,$type)=(split(/,/,$line))[1,2];
	if($cnt == 0) {
		$name = (split(/_id/,$col))[0];
		print "DROP TABLE IF EXISTS $name;\n";
		print "CREATE TABLE $name (\n";
		print "$col $type PRIMARY KEY";
	}
	else {
		print ",\n";
		if($type eq "varchar") { $type = $type . "(1)"; }
		print "$col $type";
	}
	$cnt++;
}
print ");\n"
