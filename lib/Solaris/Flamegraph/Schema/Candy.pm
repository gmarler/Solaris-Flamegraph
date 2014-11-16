package Solaris::Flamegraph::Schema::Candy;

use 5.18.1;

use warnings;

use parent 'DBIx::Class::Candy';

sub base { 'Solaris::Flamegraph::Schema::Result' }
sub perl_version { 18 }
sub autotable { 1 }

1;

