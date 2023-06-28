#!/usr/bin/perl
#
# Read SQL query from disk and
# send SQL queries to Rocto
#

use DBI;
use strict;

my $user = $ARGV[0];
my $pass = $ARGV[1];

chomp(my $file = ($ARGV[2]));
print "SQL file is: " . $file . "\n";
die "Invalid SQL file\n" unless ($file =~/.*sql/);
die "File error: " unless -f $file;
print "SQL file is $file\n";

my $content;
my $sql;
open(my $fh, '<', $file) or die "cannot open file $file";
{
  local $/;
  chomp($sql = <$fh>);
}
close($fh);
print "SQL is $sql\n";

my $driver   = "Pg";
my $database = "tvista";
my $dsn = "DBI:$driver:dbname = $database;host = 127.0.0.1;port = 1337";
my $dbh = DBI->connect($dsn, $user, $pass, { RaiseError => 1 })
   or die $DBI::errstr;
print "Opened database successfully\n";

if($sql eq "") {
  my $sql = qq(SELECT state_id,name,abbreviation FROM state;);
}

my $sth = $dbh->prepare( $sql );
my $rv = $sth->execute() or die $DBI::errstr;
if($rv < 0) {
   print $DBI::errstr;
}

while(my @row = $sth->fetchrow_array()) {
  print join("|", @row), "\n";
}

print "Operation done successfully\n";
$dbh->disconnect();