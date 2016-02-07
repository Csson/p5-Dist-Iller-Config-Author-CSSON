use 5.10.1;
use strict;
use warnings;

package Dist::Iller::Config::Author::CSSON::MapMetro;

# ABSTRACT: Dist::Iller config for Map::Metro
our $VERSION = '0.0302';

use Moose;
use Types::Path::Tiny qw/Path/;
use Types::Standard qw/Str/;
use namespace::autoclean;

has filepath => (
    is => 'ro',
    isa => Path,
    default => 'author-csson-mapmetro.yaml',
    coerce => 1,
    documentation => q{Path to the plugin configuration file, relative to the installed share dir location.},
);
has homepage => (
    is => 'rw',
    isa => Str,
    lazy => 1,
    default => sub {
        my $self = shift;
        $self->has_distribution_name ? sprintf 'https://metacpan.org/release/%s', $self->distribution_name : undef;
    },
);
with 'Dist::Iller::Config';
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
