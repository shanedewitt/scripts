#!/usr/bin/perl
#
# Update MRN based upon ACCOUNT NUMBER
# File Format is
#
# mrn acct_number
#
open (FILE, './acct.txt');

print "var ACCT = msg['PID']['PID.18']['PID.18.1'].toString(); // account number\n";
print "\n";
print "switch(ACCT) {\n";

while(<FILE>) {
	next if /^\s+$/;
	chomp;
    ($mrn,$acct,@junk) = split;
	print "\tcase '" . $acct . "' :\n";
    print "\t\tmsg['PID']['PID.3']['PID.3.1'] = $mrn;\n";
    print "\t\tbreak;\n";
}

print "\tdefault:\n";
print "\t\tbreak;\n";
print "}\n";

close (FILE);
exit;
