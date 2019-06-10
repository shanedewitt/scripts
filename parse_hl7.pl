#!/usr/bin/perl
 
open (FILE, './hl7.txt');
while(<FILE>) {
	next if /^\s+$/;
	chomp;
	@line = ();
	($mrn,$error) = @line = split("\t");
#	($mrn,$error) = (@line)[2,9];
	$error =~ s/.*\[(.*)\]/$1/;
	$real_name = substr($error, 0, -1);
	$real_name =~ s/,/\^/;
	$hash{$mrn} = $real_name;
}
close (FILE);

foreach $mrn (sort keys %hash) {
	print "\tcase '" . $mrn . "' :\n";
	print "\t\tmsg['PID']['PID.5'] = '';\n";
	print "\t\tmsg['PID']['PID.5'] = '" . $hash{$mrn} . "';\n";
	print "\t\tbreak;\n";
}
exit;
