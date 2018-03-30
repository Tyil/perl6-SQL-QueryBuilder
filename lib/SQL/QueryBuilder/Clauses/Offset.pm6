#! /usr/bin/env false

use v6.c;

role SQL::QueryBuilder::Clauses::Offset
{
	has Int $!start;

	multi method offset(Int:D $start)
	{
		$!start = $start;

		self;
	}

	multi method offset()
	{
		$!start;
	}
}

# vim: ft=perl6 noet
