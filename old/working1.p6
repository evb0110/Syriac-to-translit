my $line = '01:01   ktbʔ dylydwth dyšwʕ mšyḥʔ܃ brh ddwyd܂ brh dʔbrhm܀܀';
my $transletters = 'ʔʔbggdrhwzḥṭṭyYklmnssʕppṣqršt';
my @transletters = $transletters.comb.unique;
@transletters.push(' ');
@transletters.append('0' .. '9');
@transletters.append(':');

say $line.subst( :g, /<!before @transletters>./, '' );
