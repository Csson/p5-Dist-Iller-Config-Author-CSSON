use 5.10.1;
use strict;
use warnings;

package Dist::Iller::Config::Author::CSSON;

# ABSTRACT: Dist::Iller config
our $VERSION = '0.0302';

use Moose;
use namespace::autoclean;
use Path::Tiny;
use Types::Path::Tiny qw/Path/;
use Types::Standard qw/Bool Str Int/;
use MooseX::AttributeDocumented;

has filepath => (
    is => 'ro',
    isa => Path,
    default => 'author-csson.yaml',
    coerce => 1,
    documentation => q{Path to the plugin configuration file, relative to the installed share dir location.},
);
has is_task => (
    is => 'ro',
    isa => Bool,
    default => 0,
    documentation => q{If set to a true value it will include [TaskWeaver] instead of [PodWeaver].},
);
has installer => (
    is => 'rw',
    isa => Str,
    lazy => 1,
    default => 'MakeMaker',
    documentation => q{The installer plugin to be used.},
);
has is_private => (
    is => 'rw',
    isa => Int,
    lazy => 1,
    default => 0,
    documentation_alts => {
        0 => q{Include [UploadToCPAN] and [GithubMeta].},
        1 => q{Include [UploadToStratopan].},
    }
);
has homepage => (
    is => 'rw',
    isa => Str,
    lazy => 1,
    default => sub {
        my $self = shift;
        $self->has_distribution_name ? sprintf 'https://metacpan.org/release/%s', $self->distribution_name : undef;
    },
    documentation_default => q{https://metacpan.org/release/[distribution_name]},
    documentation => q{URL to the distribution's homepage.},
);
has splint => (
    is => 'rw',
    isa => Int,
    default => 0,
    documentation_alts => {
        0 => q{Exclude Pod::Elemental::Transformer::Splint from weaver.ini},
        1 => q{Include Pod::Elemental::Transformer::Splint in weaver.ini},
    }
);
has travis => (
    is => 'rw',
    isa => Int,
    default => 1,
    documentation_order => 100,
    documentation_alts => {
        0 => q{Exclude [TravisYML].},
        1 => q{Include [TravisYML].},
    },
);
has travis_perl_min => (
    is => 'ro',
    isa => Int,
    lazy => 1,
    default => '10',
    documentation_order => 101,
    documentation => q{Minimum Perl version to test on Travis. All production releases up to (and including) 'travis_perl_max' are automatically included. Only give the minor version number (eg '14' for Perl 5.14).},
);
has travis_perl_max => (
    is => 'ro',
    isa => Int,
    lazy => 1,
    default => '22',
    documentation_order => 102,
    documentation => q{Maximum Perl version to test on Travis. See 'travis_perl_min'.}
);


with 'Dist::Iller::Config';

sub build_file {
    my $self = shift;
    return $self->installer =~ m/MakeMaker/ ? 'Makefile.PL' : 'Build.PL';
}

sub is_private_release {
    my $self = shift;
    return !$ENV{'FAKE_RELEASE'} && $self->is_private ? 1 : 0;
}
sub is_cpan_release {
    my $self = shift;
    return $ENV{'FAKE_RELEASE'} || $self->is_private ? 0 : 1;
}
sub add_default_github {
    my $self = shift;
    # check git config
    my $add_default_github = 0;
    my $git_config = path('.git/config');
    if($git_config->exists) {
        my $git_config_contents = $git_config->slurp_utf8;
        if($git_config_contents =~ m{github\.com:([^/]+)/(.+)\.git}) {
            $add_default_github = 1;
        }
        else {
            say ('[DI/@Author::CSSON] No github url found');
        }
    }
    return $add_default_github;
}
sub travis_perl {
    my $self = shift;
    return join ' ' => map { "5.$_" } grep { $_ >= $self->travis_perl_min && $_ <= $self->travis_perl_max } qw/6 8 10 12 14 16 18 20 22/;
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

:splint classname Dist::Iller::Config::Author::CSSON

=head1 SYNOPSIS

    # in iller.yaml
    +config: Author::CSSON
    splint: 1

=head1 DESCRIPTION

Dist::Iller::Config::Author::Csson is a L<Dist::Iller> configuration. The plugin list is in C<share/author-csson.yaml>.

=head1 ATTRIBUTES

:splint attributes

=head1 ENVIRONMENT VARIABLES

=head2 FAKE_RELEASE

If set to a true value this will include [FakeRelease] and remove either [UploadToCPAN] or [UploadToStratopan].

=cut
