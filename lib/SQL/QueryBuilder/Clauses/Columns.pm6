#! /usr/bin/env false

use v6.c;

role SQL::QueryBuilder::Clauses::Columns
{
	has Pair @!columns;

	multi method column(Pair:D $column)
	{
		@!columns.push: $column;

		self;
	}

	multi method column(*@columns)
	{
		for @columns -> $column {
			self.column($column);
		}

		self;
	}

	multi method column(Str:D $name)
	{
		self.column($name => $name);
	}

	multi method column(Str:D $name, Str:D $alias)
	{
		self.column($name => $alias);
	}

	multi method column()
	{
		@!columns;
	}
}

# vim: ft=perl6 noet
