#create user_11
package Controllers::articlesController;

use strict;
use warnings;


use vars qw(@ISA  $content @data);
use Controller;
use Models::Articles;
use Libs::Request;
use Time::Piece;
use Libs::Session;

@ISA = qw(Controllers::Controller);


sub createAction;
sub editAction;
sub deleteAction;
sub userArticlesAction;

sub userArticlesAction
{
    my ($self) = @_;
    my ($self, $userId) = @_;

    my $session =  $self->get('session');
    if(!$session->check())
    {
      #print "Location: $ENV{'SCRIPT_NAME'}\n\n";
      print "Location: index.pl\n\n";
    }
    
    # my $model = Models::Articles->new($self->get('model'), $self->get('db'));
    # my $request = Libs::Request->new();
    # $data = $model->getByUserId($userId);
    
    $data[0]->{'title'} = "Italy opens up island of Montecristo to tourists";
    $data[0]->{'id'} = 3;
    $data[1]->{'title'} = "Famed Roman statue 'not ancient' ";
    $data[1]->{'id'} = 4;
    $data[2]->{'title'} = "Japan centenarians at record high";
    $data[2]->{'id'} = 2;

    
   
    
    require 'articles/user_articles.pl';
    return $content; 	 
}

1;
