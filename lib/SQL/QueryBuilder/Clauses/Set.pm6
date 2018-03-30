#! /usr/bin/env false

use v6.c;

role SQL::QueryBuilder::Clauses::Set
{
	has Pair @!sets;

	multi method set(Pair:D $set)
	{
		@!sets.push: $set;

		self;
	}

	multi method set(Str:D $column, Any:D $value)
	{
		self!set($column => $value);
	}

	multi method set()
	{
		@!sets;
	}
}

# vim: ft=perl6 noet
