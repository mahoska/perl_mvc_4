package Helpers::Security;
use strict;
use warnings FATAL => 'all';

use Crypt::PBKDF2;

sub new{
    my $class = ref($_[0])||$_[0];
    return bless{}, $class;
}

sub generatePassword
{
    my ($self, $password) = @_;

    my $pbkdf2 = Crypt::PBKDF2->new(
        hash_class => 'HMACSHA2',
        hash_args => {
            sha_size => 512,
        },
        iterations => 10000,
        salt_len => 10,
    );

    return $pbkdf2->generate($password);
}

sub checkPassword
{
    my ($self, $hash, $password) = @_;

    my $pbkdf2 = Crypt::PBKDF2->new();

    if ($pbkdf2->validate($hash, $password))
    {
        return 1;
    }

    return 0;
}

1;