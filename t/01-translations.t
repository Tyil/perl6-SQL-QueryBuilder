#! /usr/bin/env perl6

use v6.c;

use SQL::QueryBuilder;
use Test;

my %table = %SQL::QueryBuilder::engines;
my @queries = « insert select update delete »;
my $self = "SQL::QueryBuilder";

plan +%table;

for %table.kv -> $original, $engine {
	subtest "$engine" => {
		plan +@queries + 1;

		my $translated-engine = qb-translate-engine($original);

		is $translated-engine, $engine, "$original translates properly";

		for @queries -> $query {
			is
				qb-translate-lib($translated-engine, $query),
				"{$self}::{$translated-engine}::{$query.tclc}",
				"$engine $query translates correctly"
			;
		}
	}
}
# vim: ft=perl6 noet
