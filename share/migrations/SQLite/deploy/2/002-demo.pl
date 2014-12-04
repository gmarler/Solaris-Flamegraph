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
          desc     => "Sigfried's Perf Analysis",
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


  $host_rs->create(
    {
      name => 'control',
      timezone => 'US/Pacific',
      flamegraphs => [
        {
          creation => DateTime->now(),
          begin    => DateTime->now(),
          end      => DateTime->now(),
          desc     => "Maxwell Smart's Perf Analysis",
          stacks   =>
'unix`sys_syscall;genunix`open;genunix`openat;genunix`falloc 36
unix`sys_syscall;genunix`open;genunix`openat;genunix`unfalloc 39
unix`sys_syscall;genunix`openat 17',
        },
      ],
    }
  );

  $host_rs->create(
    {
      name => 'fwsse37',
      timezone => 'US/Central',
      flamegraphs => [
        {
          creation => DateTime->now(),
          begin    => DateTime->now(),
          end      => DateTime->now(),
          desc     => "Number 99's Perf Analysis",
          stacks   =>
'unix`sys_syscall;genunix`open;genunix`openat;genunix`falloc 36
unix`sys_syscall;genunix`openat 17',
        },
      ],
    }
  );

};
