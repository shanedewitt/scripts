#!/usr/bin/perl

print "var DOS = msg['TXA']['TXA.7']['TXA.7.1'].toString();\n";
print "\n";
print "// send all dates listed\n";
print "switch(DOS.substring(0, 8)) {\n";
 
open (FILE, './date.txt');
while(<FILE>) {
	next if /^\s+$/;
	chomp;
	print "\tcase '" . $_ . "' : \n";
}
close (FILE);
print "\t\treturn true;\n";
print "\t\tbreak;\n";
print "\tdefault :\n";
print "\t\treturn false;\n";
print "\t\tbreak;\n";
print "}\n";

exit;
