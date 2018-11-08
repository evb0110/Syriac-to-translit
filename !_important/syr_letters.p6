my $file_symbols = "syr_symbols";
my $alphabet;
my @alphabet;

my $all = $file_symbols.IO.slurp;

my @records = $all.split(/'-'+/);

for @records -> $record {
   my @lines = $record.lines;
   next if @lines < 5;
   my $codepoint = 
         $record.comb(/ \S* <[0 .. 9]> + \S* /)
         ;
   my $translit = @lines[4].trim;
   say "$codepoint $translit";
   @alphabet.push($translit);
   
}
# say @alphabet.unique.join;
