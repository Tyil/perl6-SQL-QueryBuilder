#! /usr/bin/env false

use v6.c;

use SQL::QueryBuilder::Clauses::Limit;
use SQL::QueryBuilder::Clauses::OrderBy;
use SQL::QueryBuilder::Clauses::Set;
use SQL::QueryBuilder::Clauses::Where;
use SQL::QueryBuilder::Query;

class SQL::QueryBuilder::Query::Update is SQL::QueryBuilder::Query
{
	also does SQL::QueryBuilder::Clauses::Set;
	also does SQL::QueryBuilder::Clauses::Where;
	also does SQL::QueryBuilder::Clauses::OrderBy;
	also does SQL::QueryBuilder::Clauses::Limit;
}

# vim: ft=perl6 noet
