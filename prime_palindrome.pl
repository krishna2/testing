#!/usr/bin/env perl

use strict;

my $upto = shift || 1000;
my @p = (2, 3, 5, 7);
my $num = 11;

while ( $num < $upto ) {
    my $is_prime = 1;
    my $limit = int(sqrt($num));
    foreach my $i ( @p ) {
        last if $i > $limit;
        if ( $num % $i == 0 ) {
            $is_prime = 0;
            last;
        }
    }

    push @p, $num if ( $is_prime );
    $num += 2;
}

my %h = map { $_ => 1 } @p;

my $count = 1;
print "List of prime palindromes\n";
foreach my $i ( @p ) {
    my $j = reverse "$i";
    next if $i == $j;
    last if $i > $upto/2;
    if ( $h{$j} ) {
        print "$i, $j\n";
        $count++;
    }
}

print "\nA total of $count prime palindrome pairs found (when counted upto $upto)\n";

#####
