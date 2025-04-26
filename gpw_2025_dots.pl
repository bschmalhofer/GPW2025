use strict;
use warnings;

use Data::Dump;

# Range mit drei Punkten in freier Wildbahn, sprich OTOBO, angetroffen.
# Das muss man doch optimieren können.
{
    my @p3 = 1 ... 3;
    dd [ p3 => \@p3 ];
}

# dasselbe wie Range mit zwei Punkten
{
    ## no critic qw(Mama::Don't::Allow::No::Perl::Golfing::Around::Here)

    # disk space is cheap, no need for non-idiomatic Perl
    my @p2 =  1 .. 3;
    dd [ p2 => \@p2 ];
}

WAS_GIBT_ES_SONST_NOCH_MIT_DREI_PUNKTEN:

# yada-yada
{
    eval { ... };
    dd [ eval_error => $@ ];
}

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

# vier Punkte mit Bereich
{
    my @p4 = -2 ....1;
    dd [ p4 => \@p4 ];
}

# fünf Punkte sind schwierig
{
    my @p4 = -2. ....1;
    dd [ p4 => \@p4 ];

    # flip-flop auch nur maximal vier Punkte
    seek DATA, $data_start, 0;
    while ( <DATA> ) {
        print if 2*8+6. ....0;
    }

    # mit Konkatenierung kommt man auch nicht weit
    my $s1 = 2. . .1;
    dd [ s1 => $s1 ];
}

# der Zeilenzähler reißt die Sache raus
{
    # aber nicht mit Konkatenierung
    $. = -.0;
    my $s1 = $
    . . .1;
    dd [ s1 => $s1 ];

    # sondern mit Bereich
    $. = +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-3;
    my @p5 = $              .....0;
    dd [ p5 => \@p5 ];
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

# bei sechs Punkten fällt mit nichts mehr ein
{
    eval { ...;... }; ## no critic qw(Complain::About::Judiciously::Injected::Semicolons)
    dd [ eval_error => $@ ];
}

# Cheat modus

# Lügem mit Format
{
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

# Im Semikolon ist ja auch ein Punkt
{
    ## no critic qw(Lower::Half::Counts)
    ;;;;;;;;;;;;;;;;;;
    eval { ...;...;...;...;... };
    dd [ eval_error => $@ ];
}

# oder im Bang
{
    ## no critic qw(Upper::Two::Thirds::Count)
    my $whatever = !!!!!!!!!!!!!!!!!!!!!!!!!!!!!$.;
    dd [ whatever => $whatever ];
}

# https://perlhacks.com/2014/01/dots-perl/
# https://github.com/RotherOSS/otobo/issues/4040
# https://rt.cpan.org/Ticket/Display.html?id=158636

__DATA__
Kopfzeile
1.Zeile
2.Zeile
3.Zeile
4.Zeile
