#! /usr/bin/env false

use v6.c;

role SQL::QueryBuilder::Clauses::Limit
{
	has Int $!max;

	multi method limit(Int:D $max)
	{
		$!max = $max;

		self;
	}

	multi method limit()
	{
		$!max;
	}
}

# vim: ft=perl6 noet
