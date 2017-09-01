package Controllers::registrationController;

use strict;
use warnings;
use vars qw($regform);

use vars qw(@ISA);
use Controller;
@ISA = qw(Controllers::Controller);

use Libs::Request;

use Models::Validation;

sub registrationAction;
sub loginAction;
sub logoutAction;

sub findUserAction;
sub updateUserAction;
sub profilInfoAction;

use Data::Dumper;


sub registrationAction
{
 my ($self) = @_;
 my (%form, $valid, $is_valid, $model);
 my $request = Libs::Request->new();
 
 if($request->isPost())
 {
   %form = (
             'login'=>  $request->getData('login'),
             'password'=> $request->getData('password'),
             'password_v'=> $request->getData('password_v'),
             'email'=> $request->getData('email')
             ); 

   $valid = Models::Validation->new();
   $is_valid = $valid->checkRegForm(%form);
   if ($is_valid)
   {
       $model = Models::Users->new($self->get('model'), $self->get('db'));
       return $model->createUser(\%form); 
   }

 
}

 require "user/registration.pl";
 return $regform;
}

1;