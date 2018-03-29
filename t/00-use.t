#! /usr/bin/env perl6

use v6.c;

use JSON::Fast;
use Test;

my @provides = from-json(slurp("META6.json"))<provides>.keys;

plan @provides.elems;

for @provides -> $provide {
	use-ok $provide, "$provide can be used";
}

# vim: ft=perl6 noet
