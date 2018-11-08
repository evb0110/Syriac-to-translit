my $syr_symbols = 'syr_symbols';
my @records = $syr_symbols.IO.split(/'-' ** 5..*/);
my %translit;
for @records -> $record {
  my @lines = $record.comb(/\N+/);
  next if @lines.elems < 3;
  my $codepoint = '0x' ~ @lines[1].comb(/\S*\d+\S*/);
  my $syrchar = $codepoint.chr;
  %translit{$syrchar} = '';
  next unless defined @lines[3];
  my $transletter = @lines[3].trim;
  %translit{$syrchar} = $transletter;
#  say "$codepoint:     $syrchar  $transletter";
  
}
say %translit;



my $line = '01:01	ܟܿܬܼܒܼܐ ܕܿܝܠܝܕܼܘܼܬܼܗ ܕܿܝܫܘܼܥ ܡܫܝܚܐ܃ ܒܿܪܗ ܕܿܕܼܘܝܕܼ܂ ܒܿܪܗ ܕܿܐܒܼܪܗܡ܀܀';
$line .= samemark('a');
my $nline = $line.trans(%translit);
say $nline;
