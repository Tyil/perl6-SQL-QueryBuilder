#! /usr/bin/env false

use v6.c;

use SQL::QueryBuilder::Clauses::Columns;
use SQL::QueryBuilder::Clauses::Limit;
use SQL::QueryBuilder::Clauses::Offset;
use SQL::QueryBuilder::Clauses::OrderBy;
use SQL::QueryBuilder::Clauses::Where;
use SQL::QueryBuilder::Query;

class SQL::QueryBuilder::Query::Select is SQL::QueryBuilder::Query
{
	also does SQL::QueryBuilder::Clauses::Columns;
	also does SQL::QueryBuilder::Clauses::Where;
	also does SQL::QueryBuilder::Clauses::OrderBy;
	also does SQL::QueryBuilder::Clauses::Limit;
	also does SQL::QueryBuilder::Clauses::Offset;

	method from(Str:D $table) { self.table($table) }
	multi method select(Pair:D $column) { self.column($column) }
	multi method select(*@columns) { self.column(|@columns) }
	multi method select(Str:D $name, Str:D $alias) { self.column($name => $alias) }
	method skip(Int:D $limit) { self.offset($limit) }
	method take(Int:D $limit) { self.limit($limit) }
}

# vim: ft=perl6 noet
