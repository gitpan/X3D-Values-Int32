package X3D::Values::Int32;

use 5.008008;
use strict;
use warnings;

use Package::Alias X3DInt32 => __PACKAGE__;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use X3D::Values::Int32 ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = (
   'all' => [
      qw(
        MIN_INT32
        MAX_INT32
        )
   ]
);

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our $VERSION = '0.005';

require XSLoader;
XSLoader::load( 'X3D::Values::Int32', $VERSION );

# Preloaded methods go here.

use overload (

   '=' => 'getClone',

   'bool' => '_bool',
   '0+'   => 'getValue',

   '!' => '_not',

   '=='  => '_neq',
   '!='  => '_nne',
   '<=>' => '_ncmp',

   #'>' => '_ngt',
   #'<' => '_nlt',
   #'>=' => '_nge',
   #'<=' => '_nle',

   'eq'  => '_eq',
   'ne'  => '_ne',
   'cmp' => '_cmp',

   #'gt' => '_gt',
   #'lt' => '_lt',
   #'ge' => '_ge',
   #'le' => '_le',

   '~' => 'complement',

   '&='  => '_and',
   '|='  => '_or',
   '^='  => '_xor',
   '<<=' => '_sleft',
   '>>=' => '_sright',

   '&'  => 'and',
   '|'  => 'or',
   '^'  => 'xor',
   '<<' => 'sleft',
   '>>' => 'sright',

   'neg' => 'negate',

   '++' => '_inc',
   '--' => '_dec',

   '+=' => '_add',
   '-=' => '_subtract',

   '*='  => '_multiply',
   '/='  => '_divide',
   '%='  => '_modulo',
   '**=' => '_pow',

   #'.='  => '_dot',
   #'x='  => '_x',

   '+' => 'add',
   '-' => 'subtract',

   '*'  => 'multiply',
   '/'  => 'divide',
   '%'  => 'modulo',
   '**' => 'pow',

   #'.'  => 'dot',
   #'x'  => 'x',

   'int' => 'getValue',
   'abs' => 'abs',

   'cos' => 'cos',
   'sin' => 'sin',

   'exp' => 'exp',
   'log' => 'log',

   'sqrt' => 'sqrt',

   'atan2' => 'atan2',

   #'<>'

   #'${}', '@{}', '%{}', '&{}', '*{}'.

   #'nomethod', 'fallback',

   '""' => 'toString',

   #fallback => 1,
);

use constant getDefaultValue => 0;

sub toString { sprintf "%d", $_[0]->getValue }

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

X3D::Values::Int32 - Storage type for 32 bit signed integers

=head1 ALIAS

X3DInt32

=head1 SYNOPSIS

  use X3D::Values::Int32;
  my $int32 = new X3D::Values::Int32(1);
  $int32++;
  my $half = 1 / $int32; # 0.5

=head1 DESCRIPTION

This module adds support for 32 bit signed integers.

=head1 CONSTANTS

=head2 MIN_INT32

	my $min_int32 = X3DInt32::MIN_INT32;

=head2 MAX_INT32

	my $max_int32 = X3DInt32::MAX_INT32;

=head1 FUNCTIONS

=head2 new(value)

	my $int32 = new X3D::Values::Int32(1234);

=head1 EXPORT

None by default.

Exports I<MIN_INT32> and I<MAX_INT32>, export tag I<-all>

	use X3D::Values::Int32 -all;
	my $min_int32 = MIN_INT32;
	my $max_int32 = MAX_INT32;

=head1 SEE ALSO

=head1 BUGS

=item * needed at least a 32 bit architecture

=head1 AUTHOR

Holger Seelig, I<hooo(at)cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Holger Seelig

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
