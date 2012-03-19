use strict;
use warnings;

package Courriel::MMS::Plugin::TmobileUK;
use namespace::autoclean;
use Moose;

extends 'Courriel::MMS';

# --- Class methods ---

sub match {
    my $class = shift;
    my $email = shift;

    return 1 if $email->from =~ /mmsreply\.t-mobile\.co\.uk$/;
    return;
}


# --- Instance methods ---

around 'get_mms_images' => sub {
    my $orig = shift;
    my $self = shift;

    return grep { $_->[0] !~ /^logo.gif$/ } $self->$orig( @_ );
};

__PACKAGE__->meta()->make_immutable();

1;

__END__

# ABSTRACT: L<Courriel::MMS> extension for dealing with MMS messages from T-mobile UK

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 CLASS METHODS

=head1 INSTANCE METHODS

=head2 C<get_mms_images>

=head1 SEE ALSO

=head2 L<<< Courriel >>>

=head1 AUTHOR

Zbigniew Łukasiak, E<lt>zlukasiak@opera.comE<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (c), 2011 Opera Software ASA.
All rights reserved.
