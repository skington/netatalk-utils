#!/usr/bin/env perl
# Open a URL on my local Mac, not this VM.
# Set the BROWSER environment variable to this script's path and
# e.g. /usr/bin/sensible-browser will call it if you use
# something like Browser::Open to open URLs in a platform-agnostic manner.

use strict;
use warnings;
no warnings 'uninitialized';

my $mac_hostname = 'deceptive.local';

my $url = shift;
my ($mac_ipaddress)
    = `avahi-resolve --name $mac_hostname -4`
    =~ m{ ( (?: \d{1,3}[.] ){3} \d{1,3} ) }x;
exec(qq{ssh $mac_ipaddress 'open "$url"'});
