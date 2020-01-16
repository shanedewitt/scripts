#!/usr/bin/perl -w

die "Need Directory\n" unless @ARGV;
die "Not a Directory\n" unless -d $ARGV[0];

$files_per_zip = 100;
$zip_prefix = "pophealth";
$zip_suffix = "01";
$dir = $ARGV[0];

print $zip_prefix . $zip_suffix . ".zip\n";

while(<$dir/*>) {
        if (-f) {
                $total++;
                if($total % $files_per_zip == 0) {
                        $zip_suffix++;
                        print $zip_prefix . $zip_suffix . ".zip\n";
                }
                $cmd = "zip " . $zip_prefix . $zip_suffix . ".zip $_";
                `$cmd`;
                if($?) { die "Error: $? $cmd\n"; }
                print "zipping $_\n";
        }
}

