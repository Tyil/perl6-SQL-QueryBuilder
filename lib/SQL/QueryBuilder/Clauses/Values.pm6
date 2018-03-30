#! /usr/bin/env false

use v6.c;

role SQL::QueryBuilder::Clauses::Values
{
	has @!records;

	#| Add a record to be inserted.
	multi method values(
		*@records, #= Any number of column => value pairs.
	) {
		for @records -> %record {
			self.value(%record);
		}

		self;
	}

	multi method values()
	{
		@!records;
	}

	multi method value(
		*@pairs
	) {
		my %record;

		for @pairs -> $pair {
			%record{$pair.key} = $pair.value;
		}

		self.value(%record);
	}

	multi method value(
		%record,
	) {
		@!records.push: %record;

		self;
	}
}

# vim: ft=perl6 noet
