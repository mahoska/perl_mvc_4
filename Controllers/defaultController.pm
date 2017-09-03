package Controllers::defaultController;


use strict;
use warnings;

use Data::Dumper;
use vars qw($content @data);

use vars qw(@ISA);
use Controller;

@ISA = qw(Controllers::Controller);

use Models::Articles;
sub homeAction;
sub authorsAction;

sub homeAction
{
    my ($self) = @_;

    my $model = Models::Articles->new($self->get('model'), $self->get('db'));
    @data = $model->getAll();

    require 'articles/articles.pl';
    return $content; 
}

sub authorsAction
{
     my ($self) = @_;
     require 'authors/camel_team.pl';
     return $content; 
}

1;
