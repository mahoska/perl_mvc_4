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

sub new{
    my $class = ref($_[0])||$_[0];
    return bless{}, $class;
}

sub homeAction
{
    my ($self) = @_;

    my $model = Models::Articles->new($self->get('model'), $self->get('db'));
    @data = $model->getAll();

    require 'articles/articles.pl';
    return $content; 
}

1;
