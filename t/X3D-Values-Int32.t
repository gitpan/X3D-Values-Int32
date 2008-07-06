#!/usr/bin/perl -w
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl X3D-Values-Int32.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More no_plan;
use strict;

BEGIN {
   $| = 1;
   chdir 't' if -d 't';
   unshift @INC, '../blib/lib';
   unshift @INC, '../blib/arch';
   use_ok('X3D::Values::Int32');
}

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my ( $v, $c, $e );

isa_ok new X3D::Values::Int32, 'X3D::Values::Int32';
isa_ok new X3DInt32,           'X3D::Values::Int32';
isa_ok new X3DInt32,           'X3DInt32';

#isa_ok new X3D::Values::Int32(undef), 'X3D::Values::Int32';
#isa_ok new X3DInt32(undef),           'X3D::Values::Int32';
#isa_ok new X3DInt32(undef),           'X3DInt32';

isa_ok new X3D::Values::Int32, 'X3D::Values::Int32';

isa_ok new X3DInt32(0), 'X3D::Values::Int32';
isa_ok new X3DInt32(0), 'X3DInt32';

is $v = new X3DInt32(0), 0;
is $v = new X3DInt32($v), 0;
is $v->getValue, 0;
is $v->toString, 0;

is sprintf( "%d", $v ), 0;
ok $v ? 0 : 1;
ok !$v;

is $v = new X3DInt32(0), 0;
is $v = new X3DInt32($v), 0;
is $v->getValue, 0;
is $v->toString, 0;
is sprintf( "%d", $v ), 0;
ok $v ? 0 : 1;
ok !$v;

is $v = new X3DInt32(1), 1;
is $v = new X3DInt32($v), 1;
is $v->getValue, 1;
is $v->toString, 1;
is sprintf( "%d", $v ), 1;
ok $v;
ok !!$v;

is $v = new X3DInt32( 2**31 - 1 ), 2147483647;
is $v = new X3DInt32($v), 2147483647;
is $v->getValue, 2147483647;
is $v->toString, 2147483647;
is sprintf( "%d", $v ), 2147483647;
ok $v;
ok !!$v;

is $v = new X3DInt32( 2**31 ), -2147483648;
is $v = new X3DInt32($v), -2147483648;
is $v->getValue, -2147483648;
is $v->toString, -2147483648;
is sprintf( "%d", $v ), -2147483648;
ok $v;
ok !!$v;

is $v = new X3DInt32(-2147483649), 2147483647;
is $v = new X3DInt32($v), 2147483647;
is $v->getValue, 2147483647;
is $v->toString, 2147483647;
is sprintf( "%d", $v ), 2147483647;
ok $v;
ok !!$v;

is $v = new X3DInt32(2147483649), -2147483647;
is $v = new X3DInt32($v), -2147483647;
is $c = $v->getClone, -2147483647;
ok $v == -2147483647;
ok !!$v;

is $v->setValue(0), undef;
is $c, -2147483647;
is $v->getValue, 0;
is $v = new X3DInt32($v), 0;
is $c = $v->getClone, 0;
ok $v ? 0 : 1;
ok !$v;
ok $v == 0;
ok !( $v != 0 );

is $v->setValue(0), undef;
is $c, 0;
is $v->getValue, 0;
is $v = new X3DInt32($v), 0;
is $c = $v->getClone, 0;
ok $v ? 0 : 1;
ok !$v;
ok $v == 0;
ok !( $v != 0 );

is $v->setValue(1), undef;
is $c, 0;
is $v->getValue, 1;
is $v->getValue, 1;
is $v->getValue, 1;
is $v->getValue, 1;
is $v->getValue, 1;
is $v = new X3DInt32($v), 1;
is $c = $v->getClone, 1;
ok $v;
ok !!$v;
ok $v == 1;
ok !( $v != 1 );

is $v->setValue(1234), undef;
is $c, 1;
is $v->getValue, 1234;
is $v->getValue, 1234;
is $v->getValue, 1234;
is $v->getValue, 1234;
is $v = new X3DInt32($v), 1234;
is $c = $v->getClone, 1234;
ok $v;
ok !!$v;
ok $v == 1234;
ok !( $v != 1234 );

is $v != $c, '';
is $c != $v, '';
is $v == $c, 1;
is $c == $v, 1;
is $v > $c, '';
is $c > $v, '';
is $v < $c, '';
is $c < $v, '';
is $v <= $c, 1;
is $c <= $v, 1;
is $v >= $c, 1;
is $c >= $v, 1;
is $v <=> $c, 0;
is $c <=> $v, 0;
is $v eq $c, 1;
is $c eq $v, 1;
is $v ne $c, '';
is $c ne $v, '';
is $v cmp $c, 0;
is $c cmp $v, 0;
is $v->setValue(2147483649), undef;
is $v != $c, 1;
is $c != $v, 1;
is $v == $c, '';
is $c == $v, '';
is $v > $c, '';
is $c > $v, 1;
is $v < $c, 1;
is $c < $v, '';
is $v <= $c, 1;
is $c <= $v, '';
is $v >= $c, '';
is $c >= $v, 1;
is $v <=> $c, -1;
is $c <=> $v, 1;
is $v eq $c, '';
is $c eq $v, '';
is $v ne $c, 1;
is $c ne $v, 1;
is $v cmp $c, -1;
is $c cmp $v, 1;
is $c, 1234;
is $v->getValue, -2147483647;
is $v = new X3DInt32($v), -2147483647;
is $c = $v->getClone, -2147483647;
ok $v;
ok !!$v;
ok $v == -2147483647;
ok !( $v != -2147483647 );

is $v->setValue(-2147483649), undef;
is $v->setValue(-2147483649), undef;
is $v->setValue(-2147483649), undef;
is $v->setValue(-2147483649), undef;
is $c, -2147483647;
is $v->getValue, 2147483647;
is $v = new X3DInt32($v), 2147483647;
is $v->getClone, 2147483647;
ok $v;
ok !!$v;
ok $v == 2147483647;
ok $v != -2.123;

is $v = new X3DInt32(1.123), 1;
is $v = new X3DInt32($v), 1;
is $v = new X3DInt32(1.898), 1;
is $v = new X3DInt32($v), 1;
is $v = new X3DInt32(-1.123), -1;
is $v = new X3DInt32($v), -1;
is $v = new X3DInt32(-1.898), -1;
is $v = new X3DInt32($v), -1;
ok !!$v;
ok $v == -1;
ok !( $v == -1.123 );
ok $v != -1.123;

is new X3DInt32(-1.123), -1;

is $v = new X3DInt32(-1.0), -1;
ok $v == -1;

is $v = new X3DInt32(6789.123), 6789;
is $v = new X3DInt32($v), 6789;
is $v = new X3DInt32(6789.898), 6789;
is $v = new X3DInt32($v), 6789;
is $v = new X3DInt32(-6789.123), -6789;
is $v = new X3DInt32($v), -6789;
is $v = new X3DInt32(-6789.898), -6789;
is $v = new X3DInt32($v), -6789;
ok !!$v;
ok $v == -6789;
ok !( $v == -1.123 );
ok $v != -1.123;

is int( new X3DInt32(6789.898) ), 6789;
is abs( new X3DInt32(6789.898) ),  6789;
is abs( new X3DInt32(-6789.898) ), 6789;
is new X3DInt32( 2**31 ), -2147483648;
is abs( new X3DInt32( 2**31 ) ), 2147483648;

is new X3DInt32(4567.987), new X3DInt32(4567);
is new X3DInt32(-1),       new X3DInt32('-1');
is new X3DInt32( 2**31 ), new X3DInt32('2147483648');
is new X3DInt32( 2**31 - 1 ), new X3DInt32('2147483647');

ok abs( new X3DInt32( -rand(2147483648) ) ) >= 0 foreach 1 .. 100;

my $p = 1234;
is cos( new X3DInt32($p) ), cos($p);
is sin( new X3DInt32($p) ), sin($p);

is exp( new X3DInt32($p) ), exp($p);
is log( new X3DInt32($p) ), log($p);

$e = eval { log( new X3DInt32(0) ) };
ok $@ ;
$e = eval { log( new X3DInt32( -rand(1000) ) ) };
ok $@ ;

is sqrt( new X3DInt32($p) ), sqrt($p);
$e = eval { sqrt( new X3DInt32(-100) ) };
ok $@ ;

is atan2( new X3DInt32($p), new X3DInt32($p) ), atan2( $p, $p );
is atan2( $p, new X3DInt32($p) ), atan2( $p, $p );
is atan2( new X3DInt32($p), $p ), atan2( $p, $p );

is $v = new X3DInt32(1), 1;
is $v += -2147483649, -2147483648;
is $v -= -2147483649, 1;

is $v = new X3DInt32(2), 2;
is $v *= 2147483647, -2147483648;

is $v = new X3DInt32(2), 2;
is $v **= 31, -2147483648;

is $v = new X3DInt32(2), 2;
is $v **= 32, -2147483648;

is $v = new X3DInt32(2), 2;
is $v **= 33, -2147483648;

is $v = new X3DInt32(), 0;
is $c = $v->getClone, 0;
is $v += 1, 1;
isa_ok $v, 'X3D::Values::Int32';
is $v += 1, 2;
is $v += 1, 3;
is $v += 1, 4;
is $v -= 1, 3;
isa_ok $v, 'X3D::Values::Int32';
is $v -= 1, 2;
is $v -= 1, 1;
is $v -= 1, 0;
is $c, 0;

is $c = $v = new X3DInt32(), 0;
is $v += 1, 1;
is $v += 1, 2;
is $v += 1, 3;
is $v += 1, 4;
is $v->getValue, 4;
is $c, 0;

is $c = $v = new X3DInt32(), 0;
is $v += 1.4, 1;
is $v += 1.4, 2;
is $v += 1.4, 3;
is $v += 1.4, 4;
is $v, 4;
is $v->getValue, 4;
is $c, 0;

is $v + 1.4, 5.4;

is $v = new X3DInt32(), 0;
is ++$v, 1;
is ++$v, 2;
is ++$v, 3;
is ++$v, 4;
is --$v, 3;
is --$v, 2;
is --$v, 1;

is $v = new X3DInt32(), 0;
is $v++, 0;
is $v++, 1;
is $v++, 2;
is $v++, 3;
is $v--, 4;
is $v--, 3;
is $v--, 2;

is $v = new X3DInt32(2147483646), 2147483646;
is $v++, 2147483646;
is $v++, 2147483647;
is $v++, -2147483648;
is $v++, -2147483647;
is $v--, -2147483646;
is $v--, -2147483647;
is $v--, -2147483648;
is $v--, 2147483647;
is $v--, 2147483646;

is $v = new X3DInt32(4), 4;
is $v *= 2.5, 10;
is $v /= 2.5, 4;
is $v *= 2.4, 9;
is $v *= 1234567890, -2147483648;

is $v = new X3DInt32(9), 9;
is $v %= 4, 9 % 2;

is $v = new X3DInt32(4), 4;
is $v * 2.5, 10;
is $v = new X3DInt32(10), 10;
is $v / 2.5, 4;

$e = eval { $v /= 0 };
ok $@;
$e = eval { new X3DInt32(-100) / 0 };
ok $@;
$e = eval { 100 / new X3DInt32(0) };
ok $@;

$e = eval { $v %= 0 };
ok $@;
$e = eval { new X3DInt32(-100) % 0 };
ok $@;
$e = eval { 100 % new X3DInt32(0) };
ok $@;

is $c = $v = new X3DInt32(2147483646), 2147483646;
is $v += 1.4, 2147483647;
is $v += 1.4, -2147483648;
is $v += 1.4, -2147483647;
is $v += 1.4, -2147483646;
is $v, -2147483646;
is $v->getValue, -2147483646;
is $c, 2147483646;

ok $c eq "2147483646";
ok !( $c eq "214748364" );
ok !( $c ne "2147483646" );
ok $c ne "214748364";

is ~$c, -2147483647;
is ~~ $c, 2147483646;

{
   my $vv = $v;
   is $c = $vv -= 2, -2147483648;
   is ~$vv, 2147483647;
   is $vv += 2, -2147483646;
}

is $c, -2147483648;
is $c - 2.4, -2147483650.4;

$v = new X3DInt32(1);
is $v, 1;
is ~$v, -2;
is $v = ~$v, -2;    #-2
is ~$v, 1;
is ~~ $v, ~1;

$v = new X3DInt32(0b10110);
is $v & 0b10011, 0b10010;
is ~$v & 0b11111, 0b01001;
is $v | 0b11111, 0b11111;
is $v | 0b11000, 0b11110;
is $v ^ 0b11111, 0b01001;
is $v ^ 0b11000, 0b01110;
is ~( $v ^ 0b11000 ) & 0b11111, 0b10001;

$v = new X3DInt32(0b10);
is $v << 2, 0b01000;
is $v >> 1, 0b00001;

$v = new X3DInt32(-2147483648);
is( $v, -2147483648 );
is( ( -$v ), 2147483648 );
is( ( -( -$v ) ), -2147483648 );
is( -( -( -$v ) ), 2147483648 );

$v = new X3DInt32(1);
is( $v, 1 );
is( ( -$v ), -1 );
is( ( -( -$v ) ), 1 );
is( -( -( -$v ) ), -1 );
is( ref -$v, '' );

$v = new X3DInt32(-1);
is( $v, -1 );
is( ( -$v ), 1 );
is( ( -( -$v ) ), -1 );
is( -( -( -$v ) ), 1 );
is( ref -$v, '' );

$v = new X3DInt32(3);
is $v**3, 27;
is 2**$v, 8;
is $v**= 3, 27;
isa_ok $v, 'X3D::Values::Int32';

is $v . '...', '27...';
is '...' . $v, '...27';
is $v x 3, '272727';

$v = new X3DInt32(3);
is 12 x $v, '121212';

$v = new X3DInt32(1);
is $v << 1, 2;
is $v << 2, 4;
is $v << 3, 8;
is $v << 4, 16;

is 1 << new X3DInt32(1), 2;
is 1 << new X3DInt32(2), 4;
is 1 << new X3DInt32(3), 8;
is 1 << new X3DInt32(4), 16;

$v = new X3DInt32(8);
is $v >> 1, 4;
is $v >> 2, 2;
is $v >> 3, 1;

is 8 >> new X3DInt32(1), 4;
is 8 >> new X3DInt32(2), 2;
is 8 >> new X3DInt32(3), 1;

is X3DInt32::MAX_INT32, 2147483647;
is X3DInt32::MIN_INT32, -2147483648;

is X3DInt32::MAX_INT32, new X3DInt32((1<<31)-1);
is X3DInt32::MIN_INT32, new X3DInt32(1<<31);

is $v = new X3DInt32(2147483648), '-2147483648';

#use Benchmark ':hireswallclock';

#my $b = new X3DInt32(1);

#timethis( -32, sub { $b = new X3DInt32() } );	#  421897.25/s
#timethis( -32, sub { $b = new X3DInt32(1) } );	# 1238142.90/s
#timethis( -32, sub { $b->getClone } );			# 1467004.44/s
#timethis( -32, sub { $b->setValue(1) } );		# 2127422.60/s
#timethis( -32, sub { $b->getValue } );			# 2069585.24/s
#timethis( -32, sub { $b? 1 : 0 } );				# 2238330.31/s
#timethis( -16, sub { !$b } );						# 1143841.04/s
#timethis( -32, sub { $b == 1 } );					#  808225.06/s
#timethis(  -8, sub { $b += 1 } );					# 1142138.01/s
#timethis( -16, sub { int($b) } );					# 2297978.44/s
#timethis( -16, sub { abs($b) } );					# 2383442.86/s
#timethis( -32, sub { $b->toString } );			# 647695.08/s

1;
__END__
