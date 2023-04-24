#!/usr/bin/perl

# Send tvista.dat and temp.dat in G/ from current server to other servers
# listed below.

# Run script from this server: CONMASTER1W10

my @servers = qw (
    CONER1W10UF
    CONICU1W10UF
    CONMASTER2W10
    CONEHR1W10UF
    CONOB1W10UF
    CONPHARM1W10UF
    CONST3W10UF
    CONU1W10UF
    CONU2W10UF
);

foreach $server (@server) {
    $cmd = "scp G/*.dat tvista\@$server:.";
    print $cmd, "\n";
}