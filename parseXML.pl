#!/usr/bin/perl
#
# Script to parse Mirth Server Configuration and create a report.
#
# NOT WORKING YET
#
use XML::Simple;
use Data::Dumper;

# create object
$xml = new XML::Simple (ForceArray => 1);
#$xml = new XML::Simple;

# read XML file
$data = $xml->XMLin("data.xml");

print "\n";
#print Dumper($data->{channels}->{channel});
#print Dumper($data);

# print output
#print "\n";
print $data->{updateSettings}->{date};
#print "\n";
#print $data->{channels}->{channel}->{name}[0];

#foreach $key (%$data) {
#foreach $channel (@{$data->{channels}}) {
#    print "channel name = $channel->{name}\n";

#    print "Channel Name: $key", "\n";
#    print "Enabled: ", $key->{enabled}, "\n";
#    print "Listen Port: ", $key->{sourceConnector}->{properties}->{listenerConnectorProperties}->{port}, "\n"; 
#    print "\n";
#}

