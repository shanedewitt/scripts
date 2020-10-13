#!/usr/bin/perl
#
# loadAccountDB.pl
#

use DBI;

$dbh = DBI->connect("dbi:mysql:dbname=account_number;host=ohfdb1;port=3306","***","***",{ RaiseError => 1, AutoCommit => 0 });

while(<STDIN>) {
  ($acct_number,$mrn,$last_name,$first_name,$m,$d,$y,$time) = split(/,/);
  $m = "0"  . $m if $m < 10;
  $d = "0"  . $d if $d < 10;
  $y = "20" . $y;
  chomp($time);
  $time = "000" . $time if (length $time == 1);
  $time = "00" . $time if (length $time == 2);
  $time = "0" . $time if (length $time == 3);

  $visit = $y . $m . $d . $time;
  die "Invalid DATE $visit\n" unless ($visit =~/\d{12}/);
  print "$acct_number,$mrn,$last_name,$first_name,$visit\n";
  eval {
    $dbh->do("INSERT INTO account_number_xref VALUES ($acct_number,$mrn,\"$last_name\",\"$first_name\",$visit)");
  };
  if ($@) {
    eval { $dbh->rollback(); };
    die "Couldn't roll back transaction: $acct_number,$mrn,$last_name,$first_name,$m,$d,$y\n" if $@;
  }
}
$dbh->commit();

