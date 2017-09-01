package Controllers::articlesController;

use strict;
use warnings;

use Data::Dumper;

use vars qw(@ISA $form @data);
use Controller;
use Models::Articles;
use Libs::Request;
use Time::Piece;

@ISA = qw(Controllers::Controller);

sub new
{
    my $class = ref($_[0])||$_[0];
    return bless{}, $class;
}


sub createAction
{
    my ($self) = @_;
    my $request = Libs::Request->new();

    # if ($request->isPost())
    # {

    my %data = (
        'title'=>  'article',
        'content'=> 'text',
        'user_id'=> '1',
        'date'=> localtime->strftime('%Y-%m-%d')
    );

    my $model = Models::Articles->new($self->get('model'), $self->get('db'));
    $model->createArticle(\%data);
#my $url = "http://www.perl.com/CPAN/";
#print "Location: $url\n\n";
#exit;
#}
}

sub editAction
{
    my ($self, $articleId) = @_;

    my $model = Models::Articles->new($self->get('model'), $self->get('db'));
    my $request = Libs::Request->new();

    @data = $model->getOne($articleId);

    if ($request->isPost())
    {
        my %data = (
            'title'=>  $request->getData('title'),
            'content'=> $request->getData('content'),
        );

        $model->updateArticle(\%data, $articleId);
        my $url = "/";
        print "Location: $url\n\n";
        exit;
    }
    require "articles/edit.pl";
    return $form;
}

sub deleteAction
{
    my ($self, $articleId) = @_;

    if ($articleId)
    {
        my $model = Models::Articles->new($self->get('model'), $self->get('db'));
        $model->deleteArticle($articleId);

        #my $url = "/";
        #print "Location: $url\n\n";
        #exit;
    }

}

1;
