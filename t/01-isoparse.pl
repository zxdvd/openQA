#!/usr/bin/perl -w

use strict;
use Data::Dump qw/pp/;
use FindBin;
use lib $FindBin::Bin.'/../www/cgi-bin/modules';
use openqa qw(parse_iso);

use Test::Simple tests => 8;

my @testdata = (
    {
        iso => "openSUSE-13.1-DVD-Biarch-i586-x86_64-Build0067-Media.iso",
        params => {
            'distri' => 'openSUSE',
            'arch' => 'i586-x86_64',
            'version' => '13.1',
            'build' => 'Build0067',
            'flavor' => 'DVD-Biarch'
        },
    },
    {
        iso => "openSUSE-13.1-Promo-DVD-OpenSourcePress-i586-x86_64-Build0002-Media.iso",
        params => {
            'distri' => 'openSUSE',
            'arch' => 'i586-x86_64',
            'version' => '13.1',
            'build' => 'Build0002',
            'flavor' => 'Promo-DVD-OpenSourcePress'
        },
    },
    {
        iso => "openSUSE-Factory-DVD-x86_64-Build0725-Media.iso",
        params => {
            'distri' => 'openSUSE',
            'arch' => 'x86_64',
            'version' => 'Factory',
            'build' => 'Build0725',
            'flavor' => 'DVD'
        },
    },
    {
        iso => "openSUSE-13.1-KDE-Live-x86_64-Build0034-Media.iso",
        params => {
            'distri' => 'openSUSE',
            'arch' => 'x86_64',
            'version' => '13.1',
            'build' => 'Build0034',
            'flavor' => 'KDE-Live'
        },
    },
    {
        iso => "openSUSE-13.1-GNOME-Live-i586-Build0045-Media.iso",
        params => {
            'distri' => 'openSUSE',
            'arch' => 'i586',
            'version' => '13.1',
            'build' => 'Build0045',
            'flavor' => 'GNOME-Live'
        },
    },
    {
        iso => "openSUSE-13.1-NET-i586-Build0042-Media.iso",
        params => {
            'distri' => 'openSUSE',
            'arch' => 'i586',
            'version' => '13.1',
            'build' => 'Build0042',
            'flavor' => 'NET'
        },
    },
    {
        iso => "openSUSE-13.1-Promo-DVD-x86_64-Build0066-Media.iso",
        params => {
            'distri' => 'openSUSE',
            'arch' => 'x86_64',
            'version' => '13.1',
            'build' => 'Build0066',
            'flavor' => 'Promo-DVD'
        },
    },
    {
        iso => "openSUSE-13.1-Rescue-CD-i686-Build0066-Media.iso",
        params => {
            'distri' => 'openSUSE',
            'arch' => 'i686',
            'version' => '13.1',
            'build' => 'Build0066',
            'flavor' => 'Rescue-CD'
        },
    },
);

for my $t (@testdata) {
    my $params = parse_iso($t->{iso});
    ok (pp($params) eq pp($t->{params}), $t->{iso});
}
