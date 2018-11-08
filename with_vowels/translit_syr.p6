#!/usr/bin/perl6

my $syr_symbols;

say 'Evaluating conversion table';

my @records = $syr_symbols.split(/'-' ** 5..*/);
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
  
}

my sub translit (Str $line) {
  my $temp_line = $line.samemark('a');
  $temp_line.trans(%translit);
}

say 'Converting:';

for @*ARGS -> $filename { # Beginning @*ARGS loop
  say "$filename";  
  (my $nfile = $filename) ~~
        s/\.txt$//
        ;
  $nfile ~= '_t.txt';

  my $text = $filename.IO.slurp;
#  my $ntext = translit $text;
  my $ntext = $text;
  $ntext ~~ s:g/ \h+ / /;
  $ntext ~~ s:g/ ^^ <!before \n> ' ' //;

  spurt $nfile, $ntext;
  say "=>   $nfile";
}   # End @*ARGS loop



BEGIN {
$syr_symbols = Q:to/ENDSYR/;
symbol: <܀>
codepoint: 700
SYRIAC END OF PARAGRAPH
------------------------------
symbol: <܁>
codepoint: 701
SYRIAC SUPRALINEAR FULL STOP
------------------------------
symbol: <܂>
codepoint: 702
SYRIAC SUBLINEAR FULL STOP
------------------------------
symbol: <܃>
codepoint: 703
SYRIAC SUPRALINEAR COLON
------------------------------
symbol: <܄>
codepoint: 704
SYRIAC SUBLINEAR COLON
------------------------------
symbol: <܅>
codepoint: 705
SYRIAC HORIZONTAL COLON
------------------------------
symbol: <܆>
codepoint: 706
SYRIAC COLON SKEWED LEFT
------------------------------
symbol: <܇>
codepoint: 707
SYRIAC COLON SKEWED RIGHT
------------------------------
symbol: <܈>
codepoint: 708
SYRIAC SUPRALINEAR COLON SKEWED LEFT
------------------------------
symbol: <܉>
codepoint: 709
SYRIAC SUBLINEAR COLON SKEWED RIGHT
------------------------------
symbol: <܊>
codepoint: 70A
SYRIAC CONTRACTION
------------------------------
symbol: <܋>
codepoint: 70B
SYRIAC HARKLEAN OBELUS
------------------------------
symbol: <܌>
codepoint: 70C
SYRIAC HARKLEAN METOBELUS
------------------------------
symbol: <܍>
codepoint: 70D
SYRIAC HARKLEAN ASTERISCUS
------------------------------
symbol: <܎>
codepoint: 70E
<reserved>
------------------------------
symbol: <܏>
codepoint: 70F
SYRIAC ABBREVIATION MARK
------------------------------
symbol: <ܐ>
codepoint: 710
SYRIAC LETTER ALAPH
ʔ
------------------------------
symbol: <ܑ>
codepoint: 711
SYRIAC LETTER SUPERSCRIPT ALAPH
ʔ
------------------------------
symbol: <ܒ>
codepoint: 712
SYRIAC LETTER BETH
b
------------------------------
symbol: <ܓ>
codepoint: 713
SYRIAC LETTER GAMAL
g
------------------------------
symbol: <ܔ>
codepoint: 714
SYRIAC LETTER GAMAL GARSHUNI
g
------------------------------
symbol: <ܕ>
codepoint: 715
SYRIAC LETTER DALATH
d
------------------------------
symbol: <ܖ>
codepoint: 716
SYRIAC LETTER DOTLESS DALATH RISH
r
------------------------------
symbol: <ܗ>
codepoint: 717
SYRIAC LETTER HE
h
------------------------------
symbol: <ܘ>
codepoint: 718
SYRIAC LETTER WAW
w
------------------------------
symbol: <ܙ>
codepoint: 719
SYRIAC LETTER ZAIN
z
------------------------------
symbol: <ܚ>
codepoint: 71A
SYRIAC LETTER HETH
ḥ
------------------------------
symbol: <ܛ>
codepoint: 71B
SYRIAC LETTER TETH
ṭ
------------------------------
symbol: <ܜ>
codepoint: 71C
SYRIAC LETTER TETH GARSHUNI
ṭ
------------------------------
symbol: <ܝ>
codepoint: 71D
SYRIAC LETTER YUDH
y
------------------------------
symbol: <ܞ>
codepoint: 71E
SYRIAC LETTER YUDH HE
Y
------------------------------
symbol: <ܟ>
codepoint: 71F
SYRIAC LETTER KAPH
k
------------------------------
symbol: <ܠ>
codepoint: 720
SYRIAC LETTER LAMADH
l
------------------------------
symbol: <ܡ>
codepoint: 721
SYRIAC LETTER MIM
m
------------------------------
symbol: <ܢ>
codepoint: 722
SYRIAC LETTER NUN
n
------------------------------
symbol: <ܣ>
codepoint: 723
SYRIAC LETTER SEMKATH
s
------------------------------
symbol: <ܤ>
codepoint: 724
SYRIAC LETTER FINAL SEMKATH
s
------------------------------
symbol: <ܥ>
codepoint: 725
SYRIAC LETTER E
ʕ
------------------------------
symbol: <ܦ>
codepoint: 726
SYRIAC LETTER PE
p
------------------------------
symbol: <ܧ>
codepoint: 727
SYRIAC LETTER REVERSED PE
p
------------------------------
symbol: <ܨ>
codepoint: 728
SYRIAC LETTER SADHE
ṣ
------------------------------
symbol: <ܩ>
codepoint: 729
SYRIAC LETTER QAPH
q
------------------------------
symbol: <ܪ>
codepoint: 72A
SYRIAC LETTER RISH
r
------------------------------
symbol: <ܫ>
codepoint: 72B
SYRIAC LETTER SHIN
š
------------------------------
symbol: <ܬ>
codepoint: 72C
SYRIAC LETTER TAW
t
------------------------------
symbol: <ܭ>
codepoint: 72D
SYRIAC LETTER PERSIAN BHETH
------------------------------
symbol: <ܮ>
codepoint: 72E
SYRIAC LETTER PERSIAN GHAMAL
------------------------------
symbol: <ܯ>
codepoint: 72F
SYRIAC LETTER PERSIAN DHALATH
------------------------------
symbol: <ܰ>
codepoint: 730
SYRIAC PTHAHA ABOVE
a
------------------------------
symbol: <ܱ>
codepoint: 731
SYRIAC PTHAHA BELOW
a
------------------------------
symbol: <ܲ>
codepoint: 732
SYRIAC PTHAHA DOTTED
a
------------------------------
symbol: <ܳ>
codepoint: 733
SYRIAC ZQAPHA ABOVE
ā
------------------------------
symbol: <ܴ>
codepoint: 734
SYRIAC ZQAPHA BELOW
ā
------------------------------
symbol: <ܵ>
codepoint: 735
SYRIAC ZQAPHA DOTTED
ā
------------------------------
symbol: <ܶ>
codepoint: 736
SYRIAC RBASA ABOVE
e
------------------------------
symbol: <ܷ>
codepoint: 737
SYRIAC RBASA BELOW
e
------------------------------
symbol: <ܸ>
codepoint: 738
SYRIAC DOTTED ZLAMA HORIZONTAL
e
------------------------------
symbol: <ܹ>
codepoint: 739
SYRIAC DOTTED ZLAMA ANGULAR
ę
------------------------------
symbol: <ܺ>
codepoint: 73A
SYRIAC HBASA ABOVE
i
------------------------------
symbol: <ܻ>
codepoint: 73B
SYRIAC HBASA BELOW
i
------------------------------
symbol: <ܼ>
codepoint: 73C
SYRIAC HBASA-ESASA DOTTED
u
------------------------------
symbol: <ܽ>
codepoint: 73D
SYRIAC ESASA ABOVE
u
------------------------------
symbol: <ܾ>
codepoint: 73E
SYRIAC ESASA BELOW
u
------------------------------
symbol: <ܿ>
codepoint: 73F
SYRIAC RWAHA
u
------------------------------
symbol: <݀>
codepoint: 740
SYRIAC FEMININE DOT
------------------------------
symbol: <݁>
codepoint: 741
SYRIAC QUSHSHAYA
------------------------------
symbol: <݂>
codepoint: 742
SYRIAC RUKKAKHA
------------------------------
symbol: <݃>
codepoint: 743
SYRIAC TWO VERTICAL DOTS ABOVE
------------------------------
symbol: <݄>
codepoint: 744
SYRIAC TWO VERTICAL DOTS BELOW
------------------------------
symbol: <݅>
codepoint: 745
SYRIAC THREE DOTS ABOVE
------------------------------
symbol: <݆>
codepoint: 746
SYRIAC THREE DOTS BELOW
------------------------------
symbol: <݇>
codepoint: 747
SYRIAC OBLIQUE LINE ABOVE
------------------------------
symbol: <݈>
codepoint: 748
SYRIAC OBLIQUE LINE BELOW
------------------------------
symbol: <݉>
codepoint: 749
SYRIAC MUSIC
------------------------------
symbol: <݊>
codepoint: 74A
SYRIAC BARREKH
------------------------------
symbol: <݋>
codepoint: 74B
<reserved>
------------------------------
symbol: <݌>
codepoint: 74C
<reserved>
------------------------------
symbol: <ݍ>
codepoint: 74D
SYRIAC LETTER SOGDIAN ZHAIN
------------------------------
symbol: <ݎ>
codepoint: 74E
SYRIAC LETTER SOGDIAN KHAPH
------------------------------
symbol: <ݏ>
codepoint: 74F
SYRIAC LETTER SOGDIAN FE
------------------------------
ENDSYR  

}
