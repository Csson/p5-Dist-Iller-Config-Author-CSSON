use Dist::Iller::Standard;

# VERSION:
# PODCLASSNAME
# ABSTRACT: Iller config for Csson

class Dist::Iller::Config::Author::CSSON using Moose with Dist::Iller::Role::Config {

    use Path::Tiny;

    has filepath => (
        is => 'ro',
        isa => Path,
        default => 'author-csson.yaml',
        coerce => 1,
    );
    has is_task => (
        is => 'ro',
        isa => Bool,
        default => 0,
    );
    has installer => (
        is => 'rw',
        isa => Str,
        lazy => 1,
        default => 'MakeMaker',
    );
    has is_private => (
        is => 'rw',
        isa => Int,
        lazy => 1,
        default => 0,
    );
    has homepage => (
        is => 'rw',
        isa => Str,
        lazy => 1,
        builder => 1,
    );
    has splint => (
        is => 'rw',
        isa => Int,
        default => 0,
    );

    method _build_homepage {
        return sprintf 'https://metacpan.org/release/' . $self->distribution_name;
    }

    method build_file {
        return $self->installer =~ m/MakeMaker/ ? 'Makefile.PL' : 'Build.PL';
    }

    method is_private_release {
        return !$ENV{'FAKE_RELEASE'} && $self->is_private ? 1 : 0;
    }
    method is_cpan_release {
        return !$ENV{'FAKE_RELEASE'} && $self->is_private ? 0 : 1;
    }
    method add_default_github {
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

    method package { __PACKAGE__ }
}

1;

__END__

=pod

=head1 SYNOPSIS

    use Dist::Iller::Config::Author::Csson;

=head1 DESCRIPTION

Dist::Iller::Config::Author::Csson is ...

=head1 SEE ALSO

=cut
