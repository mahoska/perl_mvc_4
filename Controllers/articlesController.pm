package Controllers::articlesController;

use strict;
use warnings;

use vars qw(@ISA);
use Controller;
use Models::Articles;
use Time::Piece;

@ISA = qw(Controllers::Controller);

sub new
{
    my $class = ref($_[0])||$_[0];
    return bless{}, $class;
}


sub create
{
  my ($self) = @_;

  if ($request->isPost())
  {

     %data = (
         'title'=>  $request->getData('title'),
         'content'=> $request->getData('content'),
         'user_id'=> $request->getData('user_id'),
         'create_at'=> localtime->strftime('%m/%d/%Y')
     );

     my $model = Models::Users->new($self->get('model'), $self->get('db'));
     $model->createArticle(\%$data);
     $url = "http://www.perl.com/CPAN/";
     print "Location: $url\n\n";
     exit;
  }
}

sub edit
{
  my ($self) = @_;
  my ($self, $articleId) = @_;

  if ($request->isPost())
  {
     %data = (
         'title'=>  $request->getData('title'),
         'content'=> $request->getData('content'),
     );

     my $model = Models::Users->new($self->get('model'), $self->get('db'));
     $model->updateArticle(\%$data, $articleId);
     $url = "http://www.perl.com/CPAN/";
     print "Location: $url\n\n";
     exit;
  }
}

sub delete
{
   my ($self, $articleId) = @_;

   if ($articleId)
   {
      my $model = Models::Users->new($self->get('model'), $self->get('db'));
      $model->deleteArticle($articleId);

      $url = "http://www.perl.com/CPAN/";
      print "Location: $url\n\n";
      exit;
   }

}

1;
