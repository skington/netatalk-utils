#!/usr/bin/env perl
# Script to get a new wifi connection and tell Mac OS that it needs
# to remount this volume.
# Ignore all the people who tell you to use mount_afp from the command-line,
# and then have to work out what all the commands are. You can just use open.

use strict;
use warnings;
no warnings::anywhere 'uninitialized';

use IO::Interface::Simple;

my $mac_hostname = 'deceptive.local';

system('sudo /sbin/ifdown eth0 && sudo /sbin/ifup eth0');
my ($vm_ipaddress)
    = map { $_->address } grep { $_->name eq 'eth0' }
    IO::Interface::Simple->interfaces;
my ($mac_ipaddress)
    = `avahi-resolve --name $mac_hostname -4`
    =~ m{ ( (?: \d{1,3}[.] ){3} \d{1,3} ) }x;
system("ssh $mac_ipaddress 'open afp://$ENV{USER}\@$vm_ipaddress/'");
