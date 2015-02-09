use Dist::Iller::Standard;

# VERSION:
# PODCLASSNAME
# ABSTRACT: Iller config for Csson

class Dist::Iller::Config::Author::CSSON using Moose with Dist::Iller::Role::Config {

    use YAML::Tiny;

    has filepath => (
        is => 'ro',
        isa => Path,
        default => 'share/author-csson.yaml',
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
        default => sub { shift->payload->{'installer'} || 'ModuleBuildTiny' },
    );
    has is_private => (
        is => 'rw',
        isa => Int,
        lazy => 1,
        default => sub { shift->payload->{'is_private'} || 0 },
    );
    has is_task => (
        is => 'rw',
        isa => Int,
        lazy => 1,
        default => sub { shift->payload->{'is_task'} || 0 },
    );
    has homepage => (
        is => 'rw',
        isa => Str,
        lazy => 1,
        builder => 1,
    );

    method _build_homepage {
        my $distname;
        if(path('iller.ini')->exists) {
            $distname = Config::INI::Reader->read_file('iller.ini')->{'_'}{'name'};
        }
        elsif(path('dist.ini')->exists) {
            $distname = Config::INI::Reader->read_file('dist.ini')->{'_'}{'name'};
        }
        return sprintf 'https://metacpan.org/release/' . $distname;
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


    method package {
        return __PACKAGE__;
    }
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
