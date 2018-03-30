#! /usr/bin/env false

use v6.c;

use SQL::QueryBuilder::Clauses::Columns;
use SQL::QueryBuilder::Clauses::Values;
use SQL::QueryBuilder::Query;

class SQL::QueryBuilder::Query::Insert is SQL::QueryBuilder::Query
{
	also does SQL::QueryBuilder::Clauses::Columns;
	also does SQL::QueryBuilder::Clauses::Values;

	method into(Str:D $table) { self.table($table) }
	method record(*@pairs) { self.value(|@pairs) }
	method records(*@records) { self.values(|@records) }
}

# vim: ft=perl6 noet
