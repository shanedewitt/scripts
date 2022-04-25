#!/usr/bin/perl -w

# Add a printer to cups using lpadmin api
#
# example command:
#
# lpadmin -p aplbl_pro -L "APLBL_PRO" -E -v lpd://172.20.89.71 -m raw
#
# input file is named "printers.txt".
# format of file is ip address of printer, 1 or more blanks or tabs, followed by the printer name.
# example:
#
# 172.20.0.80 testprt1

my $cmd = "which lpadmin";
my $junk = `$cmd`;
if ($?) {
   warn "lpadmin note found: $!\n";
}

open(IN,'./printers.txt') or die "printers.conf not found: $!\n";

while(<IN>) {
    next if /^\s+$/;
    my($ip,$printer) = split;
    $cmd = 'lpadmin -p ' . (lc $printer) . ' -L "' . (uc $printer) . '" -E -v lpd://' . $ip . ' -m raw';

    # show example commad to create printers - pass no arguments
    print "Example command to create printer: " . lc $printer . "\n" if $#ARGV + 1 == 0;
    print "$cmd\n" if $#ARGV + 1 == 0;

    # run command to create printers - pass any argument
    print "Creating printer: " . lc $printer . "\n" if $#ARGV + 1 > 0;
    $output = `$cmd` if $#ARGV + 1 > 0;
    print "$output\n" if $#ARGV + 1 > 0;
    if ($?) {
        warn "Error running lpadmin command: $!\n";
    }
}
