#! /usr/bin/env false

use v6.c;

unit module SQL::QueryBuilder;

#| A translation table to get to the correct QueryBuilder subclass.
our %engines =
	"mysql" => "MySQL",
	"pg" => "PostgreSQL",
	"postgres" => "PostgreSQL",
	"postgresql" => "PostgreSQL",
	"sqlite" => "SQLite",
;

sub qb(
	Str:D $engine,
	Str:D $query,
) is export {
	my Str $lib = qb-translate-lib(qb-translate-engine($engine), $query);

	require ::($lib);

	::($lib).new;
}

sub qb-translate-lib(
	Str:D $engine,
	Str:D $query,
) is export {
	"SQL::QueryBuilder::{$engine}::$query.tclc()";
}

sub qb-translate-engine(
	Str:D $engine,
) is export {
	return %engines{$engine} if %engines{$engine};

	$engine;
}

# vim: ft=perl6 noet
