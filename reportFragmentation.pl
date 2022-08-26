#!/usr/bin/perl -w

chomp($TMP = `mktemp -u`);
$cmd = "mupip integ -full -nomap -region '*' > $TMP 2>&1";
print "$cmd\n";
system($cmd) or warn "Error: $?\n";
sleep(2);

open(TMP,"$TMP") or die "Can't open file: $TMP $!\n";

while(<TMP>) {
    chomp;
    s/^\s+//; # remove leadin spaces
    next if (/^\s+$/); # skip blank lines
    if (/Integ/)  {
	print $_, "\n";
	print "Global Variable,None-Adjacent Blocks,Total Blocks,Fragmentation %", "\n";
	next;
    } 
    if (/Global variable (.*)/) { print"$1"; }
    if (/^0/) {
	@pieces = ();
	@pieces = split;
	$fragPercent = "Unknown";
	if($pieces[4] eq "NA") { next; }
	else {
	    $fragPercent = 100-100*$pieces[4]/$pieces[1];
	}
	print ",";
	print $pieces[1]-$pieces[4];
	print ",";
	print $pieces[1];
	print ",";
	if($fragPercent ne "Unknown") {
	    $fragPercent = sprintf("%5.2f", $fragPercent);
	    print $fragPercent;
	}
	else {
	    print $fragPercent;
	}
	print "\n";
    }
}
close (TMP);
unlink $TMP;

