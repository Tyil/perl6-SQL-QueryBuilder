#! /usr/bin/env false

use v6.c;

class SQL::QueryBuilder::Query
{
	has Str @!tables;

	multi method table(Str:D $name)
	{
		@!tables.push: $name;

		self;
	}

	multi method table()
	{
		@!tables
	}

	method Str { … }
}

# vim: ft=perl6 noet
