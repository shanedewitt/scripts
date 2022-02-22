#!/usr/bin/perl

use strict;
use IPC::Open3;

my $pid = open3(\*CHLD_IN, \*CHLD_OUT, \*CHLD_ERR, 'cat')
    or die "open3() failed $!";

my $r;

do {
    print("> ");
    chomp($_ = <>);
    print CHLD_IN "$_\n";
    chomp($r = <CHLD_OUT>);
    print "Child Response: $r\n";
    warn() if $@;
} while ($_ ne "exit");
