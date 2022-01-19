#!/usr/bin/perl

#open (FILE, '/tmp/xtmp.txt');
$first = "true";
#while (<FILE>) {
while (<>) {
    chomp;
    @line = ();
    @line = split(",");
    if($line[1] =~ /^0\)=/) {
        print "Child nodes: $n\n" if $first eq "false";
        print $_, "\n";
        $n = -1;
        $first = "false";
    }
    $n++
}
close (FILE);
exit;

