#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use lib qw(libs);
use File::Basename qw(dirname);
use lib dirname(__FILE__).'/Views/';
use lib dirname(__FILE__).'/Libs/';
use lib dirname(__FILE__).'/Controllers/';
use lib dirname(__FILE__).'/Models/';
use lib dirname(__FILE__).'/Helpers/';
use Models::Articles;


my $db = Models::Articles->new();


my %post = ('login' => 'cr7',);

print Dumper $db->getAll();







