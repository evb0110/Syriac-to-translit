my %translit;
my $syrline;
my $transline;


my $translit_file = 'translit.table';
my $t_all = $translit_file.IO.slurp;
for $t_all.lines {
  (my $code, my $letter) = $_.words;
  $code = '0x' ~ $code;
  $syrline ~= $code.chr;
  $transline ~= $letter;
  %translit{$code.chr} = $letter;

}
my @translit = $transline.comb.unique;
my $transuniq = @translit.join;
my $reg-prohib = "/<-[$transuniq 0..9 : ]>/".EVAL;

my $line = '01:01	ܟܿܬܼܒܼܐ ܕܿܝܠܝܕܼܘܼܬܼܗ ܕܿܝܫܘܼܥ ܡܫܝܚܐ܃ ܒܿܪܗ ܕܿܕܼܘܝܕܼ܂ ܒܿܪܗ ܕܿܐܒܼܪܗܡ܀܀';
  $line .= samemark('a');
my $nline = $line.trans(%translit);
say $nline;
@translit.push('');
 say $nline.subst( :g, $reg-prohib, ' ' );
# say $nline.subst( :g, /<!before @translit>./, '1' );
# say $nline.subst( :g, /<-[\sʔbgdrhwzḥṭyYklmnssʕpṣqršt]>/, '1' );


for @*ARGS -> $filename { # Beginning @*ARGS loop
  ( my $nfilename = $filename ) ~~
       s/\.txt$//;
  $nfilename ~= '_translit.txt';

  

}
