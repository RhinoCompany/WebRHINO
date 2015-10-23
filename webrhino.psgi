use strict;
use warnings;

use WebRHINO;

my $app = WebRHINO->apply_default_middlewares(WebRHINO->psgi_app);
$app;

