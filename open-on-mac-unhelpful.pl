#!/usr/bin/env perl
# Open a URL on my local Mac, not this VM.
# This is ridiculously unhelpful, because (a) you could just have the Mac
# open the URL directly rather than speaking it, and (b) it actually speaks
# the URL too quickly for you to type it down.

use strict;
use warnings;
no warnings 'uninitialized';

my $mac_hostname = 'deceptive.local';

my $url = shift;
my ($mac_ipaddress)
    = `avahi-resolve --name $mac_hostname -4`
    =~ m{ ( (?: \d{1,3}[.] ){3} \d{1,3} ) }x;
exec(qq{ssh $mac_ipaddress}
   . qq{ 'say "Hey, would you mind opening $url in a web browser please?"'}
);
