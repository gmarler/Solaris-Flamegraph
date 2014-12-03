use strict;
use warnings;

use DBIx::Class::Migration::RunScript;
use DateTime qw();

migrate {

  my $host_rs = shift
    ->schema->resultset('Host');

  $host_rs->create(
    {
      name => 'kaos',
      timezone => 'US/Eastern',
      flamegraphs => [
        {
          creation => DateTime->now(),
          begin    => DateTime->now(),
          end      => DateTime->now(),
          stacks   =>
          'unix`sys_syscall;genunix`open;genunix`openat;genunix`falloc 36
unix`sys_syscall;genunix`open;genunix`openat;genunix`set_errno 9
unix`sys_syscall;genunix`open;genunix`openat;genunix`setf 16
unix`sys_syscall;genunix`open;genunix`openat;genunix`unfalloc 39
unix`sys_syscall;genunix`open;genunix`openat;genunix`vn_openat 14
unix`sys_syscall;genunix`openat 17',
        },
      ],
    }
  );

};
