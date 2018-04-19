#! /usr/bin/env false

use v6.c;

use SQL::QueryBuilder::Clauses::Where;
use SQL::QueryBuilder::Clauses::OrderBy;
use SQL::QueryBuilder::Clauses::Limit;
use SQL::QueryBuilder::Query;

class SQL::QueryBuilder::Query::Delete is SQL::QueryBuilder::Query
{
	also does SQL::QueryBuilder::Clauses::Where;
	also does SQL::QueryBuilder::Clauses::OrderBy;
	also does SQL::QueryBuilder::Clauses::Limit;	
	
	multi method Delete(Str:D $table) { self.table($table) }
	multi method Delete(*@tables) {
		for @tables -> $table {
			self.table($table);
		}
	}
}

# vim: ft=perl6 noet
