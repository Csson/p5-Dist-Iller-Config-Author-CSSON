use 5.10.1;
use strict;
use warnings;

package Dist::Iller::Config::Author::CSSON::MapMetro;

use Moose;
use Types::Path::Tiny qw/Path/;
use namespace::autoclean;

# ABSTRACT: Dist::Iller config for Map::Metro
# VERSION

has filepath => (
    is => 'ro',
    isa => Path,
    default => 'author-csson-mapmetro.yaml',
    coerce => 1,
    documentation => q{Path to the plugin configuration file, relative to the installed share dir location.},
);
with 'Dist::Iller::Role::Config';
has '+main_module' => (
    default => 'Dist::Iller::Config::Author::CSSON',
);

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

:splint classname Dist::Iller::Config::Author::CSSON::MapMetro

=head1 SYNOPSIS

    # in iller.yaml
    +config: Author::CSSON::MapMetro

=head1 DESCRIPTION

Dist::Iller::Config::Author::Csson::MapMetro is a L<Dist::Iller> configuration. The plugin list is in C<share/author-csson-mapmetro.yaml>.

=cut
