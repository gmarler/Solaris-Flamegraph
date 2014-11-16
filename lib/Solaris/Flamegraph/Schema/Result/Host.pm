package Solaris::Flamegraph::Schema::Result::Host;
 

use Solaris::Flamegraph::Schema::Candy
  -components => ['InflateColumn::DateTime'];


primary_column host_id => {
  data_type         => 'int',
  is_auto_increment => 1,
};

column name => {
  data_type         => 'varchar',
  size              => '32',
};

column timezone => {
  data_type         => 'varchar',
  size              => '64',
};


has_many 'flamegraphs' => 'Flamegraph', 'flamegraph_id';

1;


