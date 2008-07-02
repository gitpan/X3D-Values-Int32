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

        )
   ]
);

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
  Int32
);

our $VERSION = '0.003';

require XSLoader;
XSLoader::load( 'X3D::Values::Int32', $VERSION );

# Preloaded methods go here.

use overload (

   '=' => 'getClone',

   'bool' => '_bool',
   '0+'   => 'getValue',

   '!' => '_not',

   '==' => '_neq',
   '!=' => '_nne',

   '<=>' => sub { $_[2] ? $_[1] <=> $_[0]->getValue : $_[0]->getValue <=> $_[1] },

   #'>' => '_ngt',
   #'<' => '_nlt',
   #'>=' => '_nge',
   #'<=' => '_nle',

   'eq' => sub { $_[0]->toString eq "$_[1]" },
   'ne' => sub { $_[0]->toString ne "$_[1]" },
   'cmp' => sub { $_[2] ? "$_[1]" cmp $_[0]->toString : $_[0]->toString cmp "$_[1]" },

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

   '*=' => '_multiply',
   '/=' => '_divide',
   '%=' => '_modulo',

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

X3D::Values::Int32 - Perl extension for blah blah blah

=head1 SYNOPSIS

  use X3D::Values::Int32;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for X3D::Values::Int32, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Holger Seelig, E<lt>hooo@cpan.org<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Holger Seelig

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
