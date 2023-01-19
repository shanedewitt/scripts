#!/usr/bin/perl -w
#
# This script parses squirrel csv output to get 
# table names, columns names and data types to make a mysql table.
#

$cnt = 0;
$last_table = "";
while (chomp($line = <>)) {
	($table,$col,$type)=split(/,/,$line);
	$name = (split(/_ID/,$col))[0];
		
	if($last_table ne $table) {
		if($cnt != 0) {
			print ");\n"
		}
		$last_table = $table; 
		print "DROP TABLE IF EXISTS $table;\n";
		print "CREATE TABLE $table (\n";
		print "$col $type";
	}
	else {
		print ",\n";
		if($type eq "varchar") { $type = $type . "(1)"; }
		print "$col $type";
	}
	if($table eq $name) {
		print " PRIMARY KEY";
	}
	$cnt++;
}

