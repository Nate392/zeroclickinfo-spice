package DDG::Spice::Translate;

use DDG::Spice;

my $dicts = 'ar|zh|cz|en|fr|gr|it|ja|ko|pl|pt|ro|es|tr';

spice to   => 'http://api.wordreference.com/0.8/{{ENV{DDG_SPICE_TRANSLATE_APIKEY}}}/json/$1/$2?callback={{callback}}';
spice from => '([a-z]+)\/([a-z]+)';

triggers query_lc => qr/^translate ([a-z]+) from ($dicts) to ($dicts)$/;

handle matches => sub {
	my ($word, $from, $to) = @_;

	my $dict = $from.$to;

	return ($dict, $word)
};

1;
