use v5.12;    # for the ellipsis ...
use strict;
use warnings;

use Data::Dump;

# Range mit drei Punktion in freier Wildbahn, sprich OTOBO, angetroffen.
# Das muss man doch optimieren können.
my @a1 = 1 ... 3;
dd [ a1 => \@a1 ];

# dasselbe wie Range mit zwei Punkten
my @a2 =  1 .. 3;
dd [ a2 => \@a2 ];

# Was gibt es sonst noch mit drei Punkten ?

# yada-yada
eval { ... };
dd [ eval_error => $@ ];

# Testdaten
my $data_start = tell DATA;
dd [ testdaten => [ <DATA> ] ];

# flip-flop
seek DATA, $data_start, 0;
while ( <DATA> ) {
    print if 10 ... /400/;
}

# Geht es besser?

# vier Punkte
my @a3 = -2 ....1;
dd [ a3 => \@a3 ];

# fünf Punkte sind schwierig
my @a4 = -2. ....1;
dd [ a4 => \@a4 ];

# flip-flop auch nur maximal vier Punkte
seek DATA, $data_start, 0;
while ( <DATA> ) {
    print if 2*8+6. ....0;
}

# Konkatenierung ist sinnlos
my $s1 = 2. . .1;
dd [ s1 => $s1 ];

# Variante mit Zeilenzähler
$. = -.0;
my $s2 = $
. . .1;
dd [ s2 => $s2 ];

$. = +-+-+-+-+-+-+-3;
my @a5 = $              .....0;
dd [ a5 => \@a5 ];

# Cheat modus

# mit format
$. = 123456789;
format STDOUT =
......................................
...........@..........................
$.
......................................
.
.0;

write;

# Im Semikolon ist ja auch ein Punkt
;;;;;;;;;;;;;;;;;;
eval { ...;...;...;...;... };
dd [ eval_error => $@ ];

# oder im Bang
my $s3 = !!!!!!!!!!!!!!!!!!!!!!!!!!!!!$.;
dd [ s3 => $s3 ];

# https://perlhacks.com/2014/01/dots-perl/
# https://github.com/RotherOSS/otobo/issues/4040
# https://rt.cpan.org/Ticket/Display.html?id=158636

__DATA__
100
200
300
400
500
600
700
800
