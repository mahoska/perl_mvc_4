package Controllers::user10Controller;

use Models::Validation;

use strict;
use warnings;
use vars qw(%hash $text2);

use vars qw(@ISA);
use Controller;
@ISA = qw(Controllers::Controller);

sub homePageAction;

sub new{
    my $class = ref($_[0])||$_[0];
    return bless{}, $class;
}

sub homePageAction
{
 my ($self) = @_;
 
 # %hash = ('name'=>'name',
          # '123'=>'321');

 # require "html.pl";
 # #print "Content-type: text/html; charset=utf-8\n\n";
 
 my $string = 'lambu rii@gmail.com';
 my $val = Models::Validation->new();
 $string = $val->clearEmail($string);
 return $string;

}

1;
