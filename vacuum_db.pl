#!/usr/bin/perl

use strict;
use warnings;
use DBI;

my $db_host = 'localhost';
my $db_port = '5432';
my $db_name = 'my_database';
my $db_user = 'my_username';
my $db_pass = 'my_password';

# Connect to the database
my $dsn = "dbi:Pg:dbname=$db_name;host=$db_host;port=$db_port";
my $dbh = DBI->connect($dsn, $db_user, $db_pass, { RaiseError => 1, AutoCommit => 1 });

# Get the database sizes before the VACUUM operation
my $before_size = get_database_size($dbh);

# Perform the VACUUM operation
$dbh->do("VACUUM FULL");

# Get the database sizes after the VACUUM operation
my $after_size = get_database_size($dbh);

# Display the sizes before and after the VACUUM operation
print "Database size before VACUUM: $before_size\n";
print "Database size after VACUUM: $after_size\n";

# Disconnect from the database
$dbh->disconnect();

sub get_database_size {
    my ($dbh) = @_;

    my $sth = $dbh->prepare("SELECT pg_database_size(current_database())");
    $sth->execute();
    my ($size) = $sth->fetchrow_array();

    return $size;
}
