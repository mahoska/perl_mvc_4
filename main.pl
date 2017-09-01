#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use lib qw(libs);

use Models::Users;


my $db = Models::Users->new();


my %post = ('login' => 'cr7',);

#print Dumper $db->createUser();

use Crypt::PBKDF2;

my $password = "12345";
my $hash = $pbkdf2->generate($password);





