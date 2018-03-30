#! /usr/bin/env false

use v6.c;

role SQL::QueryBuilder::Clauses::OrderBy
{
	has Pair @!orders;

	multi method order-by(Pair:D $order)
	{
		@!orders.push: $order;

		self;
	}

	multi method order-by(Str:D $column, Str:D $order)
	{
		self.order-by($column => $order);
	}

	multi method order-by(Str:D $column)
	{
		self.order-by($column, "ASC");
	}

	multi method order-by()
	{
		@!orders;
	}
}

# vim: ft=perl6 noet
