#!/usr/bin/perl

use strict;
use warnings;

# Get the number from the user
print "Enter a positive integer: ";
my $n = <STDIN>;
chomp($n);

# Make sure $n is a positive integer
die "Invalid input: $n" unless $n =~ /^[1-9][0-9]*$/;

# Initialize an array to hold the primes we find
my @primes = ();

# Check each number up to $n for primality
for (my $i = 2; $i <= $n; $i++) {
    # Assume $i is prime until proven otherwise
    my $is_prime = 1;
    
    # Check if $i is divisible by any prime less than it
    foreach my $prime (@primes) {
        if ($i % $prime == 0) {
            $is_prime = 0;
            last;
        }
    }
    
    # If $i is prime, add it to the list of primes
    if ($is_prime) {
        push @primes, $i;
        print "$i is prime\n";
    }
}
