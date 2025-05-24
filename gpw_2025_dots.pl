use strict;
use warnings;
no warnings 'void';

use Data::Dump qw(dd);

<<INTRO;
Der zweite Vortrag zum Thema Ticketing.
Der Code eines 🎫 Systems soll optimiert werden.
INTRO

{
    ## no critic qw(Don't::Abuse::The::Subscript::Separator)
    $; = \$DB::single;
}

# Range mit drei Punkten in freier Wildbahn, sprich OTOBO, angetroffen.
# Das muss man doch optimieren können.
{
    my @p3 = 1 ... 3;
    dd \@p3;
}
# Zielfunktion: möglichst viele Punkte hintereinander
# Die Nebenbedingung sinnvoller Effekt wird zuerst ignoriert.
--$;->$*;
'p3';

# dasselbe wie Range mit zwei Punkten
{
    ## no critic qw(Mama::Don't::Allow::No::Perl::Golfing::Around::Here)

    # I don't care what mama don't allow
    # I'll golf my Perl anyhow
    RIP_JJ_CALE:
    my @p2 =  1 .. 3;
    dd \@p2;
}
--$;->$*;
'p2';

WAS_GIBT_ES_SONST_NOCH_MIT_DREI_PUNKTEN:

# yada-yada
{
    eval { ... };
    dd $@;
}
--$;->$*;
'eval_error short';

{
    # do muas aba a greislicher Strichpunkt eine wen ma meare yadas hischreim wui
    eval { ...;... }; ## no critic qw(Complain::About::Judiciously::Injected::Semicolons)
    dd $@;
}
--$;->$*;
'eval_error long';

GEHT_DA_NOCH_WAS:

# vier Punkte mit flip/flop
my $data_start = tell DATA;
{
    # Testdaten
    dd [ testdaten => [ <DATA> ] ];

    seek DATA, $data_start, 0;
    while ( <DATA> ) {
        print if m.1....m.3.;
    }
}
--$;->$*;
'vier Punkte';

# vier Punkte mit Bereich
{
    my @p4 = -2 ....1;
    dd \@p4;
}
--$;->$*;
'vier Punkte mit Bereich';

# fünf Punkte sind schwierig
{
    my @p4 = -2. ....1;
    dd [ p4 => \@p4 ];

    # flip-flop auch nur maximal vier Punkte
    seek DATA, $data_start, 0;
    while ( <DATA> ) {
        print if 2*8+6. ....0;
    }
    --$;->$*;
    'wieder nur vier Punkte';

    # mit Konkatenierung kommt man auch nicht weit
    my $s1 = 2. . .1;
    dd $s1;
    --$;->$*;
    's1'
}

# der Zeilenzähler reißt die Sache raus
{
    # aber nicht mit Konkatenierung
    $. = -.0;
    my $s1 = $
    . . .1;
    dd $s1;
    --$;->$*;
    'nochmal s1';

    # sondern mit Bereich
    $. = +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-3;
    my @p5 = $              .....0;
    dd \@p5;
    --$;->$*;
    'p5';
}

# oder so
{
    # Testdaten
    seek DATA, $data_start, 0;
    dd [ testdaten => [ <DATA> ] ];

    seek DATA, $data_start, 0;
    while ( <DATA> ) {
        print if m.4.....4; HOMAGE_TO_M4:
    }
}
--$;->$*;
'Hommage an m4';

FINALE: $_ = $.;
{
    my @p5 = m.4.....1;
    dd [ p5 => \@p5 ];

    EINFACH_MAL_WEGLASSEN_WAS_STOERT:
    my @p6 = m......1;
    dd \@p6;
    --$;->$*;
    '@p6';

    # Oana geht no
    my @p7 = s.......1;
    dd \@p7;
    --$;->$*;
    '@p7';
}


## no critic qw(You::Are::Not::Paid::By::LOC);
BONUS:
BONUS:
BONUS:
HABEN_WIR_NOCH_ZEIT:
CHEAT_MODE:

# Lügem mit Format
{
    ## no critic qw(Avoid::Code::That::Nobody::Understands::Without::Perldoc)

    $. = 123456789;
    format STDOUT =
......................................
...........@..........................
$.
......................................
.
.0;

    write;
}
--$;->$*;
'format';

# Im Semikolon ist ja auch ein Punkt
{
    ## no critic qw(Lower::Half::Counts)
    eval { ;;;...;;;...;;;...;;;...;;; };
    dd $@;
}
--$;->$*;
 'semicolons';

# Doppelpunkte sind nur halb so gut
{
    ## no critic qw(Lower::Half::Counts)
    dd [ X => $::::::::::::::::::::::::::::::::::X ];
}
--$;->$*;
'colons';

# oder im Bang
{
    ## no critic qw(Upper::Two::Thirds::Count)
    my $irgendwas_mit_einem_haufen_bangs = !!!!!!!!!!!!!!!!!!!!!!!!!!!!!$!;
    dd [ irgendwas_mit_einem_haufen_bangs => $irgendwas_mit_einem_haufen_bangs ];
}
--$;->$*;
'bangs';

# https://perlhacks.com/2014/01/dots-perl/
# https://github.com/RotherOSS/otobo/issues/4040
# https://rt.cpan.org/Ticket/Display.html?id=158636

__DATA__
Kopfzeile
1.Zeile
2.Zeile
3.Zeile
4.Zeile
