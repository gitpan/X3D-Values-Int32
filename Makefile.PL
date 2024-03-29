use 5.008008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'X3D::Values::Int32',
    VERSION_FROM      => 'lib/X3D/Values/Int32.pm', # finds $VERSION
    PREREQ_PM         => { # e.g., Module::Name => 1.1
         Package::Alias => 0.04,
    },
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/X3D/Values/Int32.pm', # retrieve abstract from module
       AUTHOR         => 'Holger Seelig <holger@>') : ()),
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
);
