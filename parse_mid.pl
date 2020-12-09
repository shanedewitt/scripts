#!/usr/bin/perl
 
open (FILE, './hl7.txt');

print "switch(MID) {\n";

while(<FILE>) {
	next if /^\s+$/;
	chomp;
	print "\tcase '" . $_ . "' :\n";
}

print "\t\treturn true;\n";
print "\t\tbreak;\n";
print "\tdefault:\n";
print "\t\treturn false;\n";
print "}\n";

close (FILE);
exit;
