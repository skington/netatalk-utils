#!/usr/bin/env perl
# Open a URL on my local Mac, not this VM.

use strict;
use warnings;
no warnings 'uninitialized';

my $mac_hostname = 'deceptive.local';

my $url = shift;
my ($mac_ipaddress)
    = `avahi-resolve --name $mac_hostname -4`
    =~ m{ ( (?: \d{1,3}[.] ){3} \d{1,3} ) }x;
exec("ssh $mac_ipaddress 'open $url'");
