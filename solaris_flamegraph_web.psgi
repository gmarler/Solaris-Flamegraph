use strict;
use warnings;

use Solaris::Flamegraph::Web;

my $app = Solaris::Flamegraph::Web->apply_default_middlewares(Solaris::Flamegraph::Web->psgi_app);
$app;

