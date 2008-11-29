use strict;

use Test::More tests => 21;

use Music::Chord::Note;

my $cn = Music::Chord::Note->new();
isa_ok($cn, 'Music::Chord::Note', 'new');


eval { my @fail = $cn->chord(''); };
like($@, qr/No CHORD_NAME!/, "No CHORD_NAME");

eval { my @fail = $cn->chord('H'); };
like($@, qr/unknown chord H at/, "unknown chord1 H");

eval { my @fail = $cn->chord('Hm7'); };
like($@, qr/unknown chord Hm7 at/, "unknown chord2 Hm7");

eval { my @fail = $cn->chord('hoge'); };
like($@, qr/unknown chord hoge at/, "unknown chord4 hoge");

eval { my @fail = $cn->chord('Cm2'); };
like($@, qr/undefined kind of chord m2\(Cm2\) at/, "undefined kind of chord");


my %testchords = (
    'C'     => 'C E G',
    'C6'    => 'C E G A',
    'Csus4' => 'C F G',
    'C7'    => 'C E G A#',
    'CM7'   => 'C E G B',
    'Cm'    => 'C D# G',
    'Cm7'   => 'C D# G A#',
    'CmM7'  => 'C D# G B',
    'Cm13'  => 'C D# G A# D F A',
    'Csus4' => 'C F G',
    'Caug'  => 'C E G#',
    'Cdim'  => 'C D# F#',
    'Cadd2' => 'C D E G',

    'C#'     => 'C# F G#',
    'F'      => 'F A C',
    'B'      => 'B D# F#',
);

foreach my $c (sort keys %testchords){
    my @Chord = $cn->chord($c);
    is($testchords{$c}, "@Chord", $c.' -> '.$testchords{$c});
}



