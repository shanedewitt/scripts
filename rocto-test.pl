#!/usr/bin/perl

# Test octo from perl on local machine

use DBI;
use strict;

my $user = "OctoUser";
my $pass = "OctoPass";
my $add_user = "yottadb -r %ydboctoAdmin add user $user";
my $del_user = "yottadb -r %ydboctoAdmin delete user $user";

open(ADDUSER, "| $add_user") || die "Failed to add user: $! \n";
print ADDUSER "$pass\n";
sleep 2;
print ADDUSER "$pass\n";
sleep 2;
close(ADDUSER);
sleep 2;

my $driver   = "Pg"; 
my $database = "tvista";
my $dsn = "DBI:$driver:dbname = $database;host = 127.0.0.1;port = 1337";
my $dbh = DBI->connect($dsn, $user, $pass, { RaiseError => 1 })
   or die $DBI::errstr;
print "Opened database successfully\n";

my $stmt = qq(SELECT state_id,name,abbreviation FROM state;);
my $sth = $dbh->prepare( $stmt );
my $rv = $sth->execute() or die $DBI::errstr;
if($rv < 0) {
   print $DBI::errstr;
}
while(my @row = $sth->fetchrow_array()) {
      print "state_id = ". $row[0] . "\n";
      print "name = ". $row[1] ."\n";
      print "abbreviation = ". $row[2] ."\n";
}
print "Operation done successfully\n";
$dbh->disconnect();

open(DELUSER, "| $del_user") || die "Failed to delete user: $! \n";



