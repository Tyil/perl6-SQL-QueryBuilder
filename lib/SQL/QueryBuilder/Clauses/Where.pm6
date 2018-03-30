#! /usr/bin/env false

use v6.c;

role SQL::QueryBuilder::Clauses::Where
{
	has Hash @!wheres;

	multi method where(Pair:D $where)
	{
		self.where($where.key, '=', $where.value);
	}

	multi method where(Str:D $column, Any:D $value)
	{
		self.where($column, '=', $value);
	}

	multi method where(Str:D $column, Str:D $op, Any:D $value)
	{
		@!wheres.push: %(
			:$column,
			:$op,
			:$value,
		);

		self;
	}

	multi method where()
	{
		@!wheres;
	}
}

# vim: ft=perl6 noet
