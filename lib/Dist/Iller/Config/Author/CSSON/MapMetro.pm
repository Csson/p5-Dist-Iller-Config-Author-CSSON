use 5.10.0;
use strict;
use warnings;

package Dist::Iller::Config::Author::CSSON::MapMetro;

# ABSTRACT: Dist::Iller config for Map::Metro
# AUTHORITY
our $VERSION = '0.0304';

use Moose;
extends 'Dist::Iller::Config::Author::CSSON';
use Types::Path::Tiny qw/Path/;
use Types::Standard qw/Str/;
use namespace::autoclean;

has '+filepath' => (
    default => 'author-csson-mapmetro.yaml',
);
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
