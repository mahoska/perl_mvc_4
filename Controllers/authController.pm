package Controllers::authController;

use strict;
use warnings;
use vars qw($regform);

use vars qw(@ISA);
use Controller;
@ISA = qw(Controllers::Controller);

use Libs::Request;

#use Models::Validation;
use Models::Users;

sub registrationAction;
sub loginAction;
sub logoutAction;

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
             # 'password_v'=> $request->getData('password_v'),
             'email'=> $request->getData('email')
             ); 

    #$valid = Models::Validation->new();
    #$is_valid = $valid->checkRegForm(%form);
    #if ($is_valid)
    #{
       $model = Models::Users->new($self->get('model'), $self->get('db'));
       return $model->createUser(\%form); 
   #}

 
}

 require "user/registration.pl";
 return $regform;
}


sub loginAction
{
    # print "Content-type: text/html; charset=utf-8\n\n";
    # print '<pre>'.Dumper(\%ENV).'</pre>';
    my ($self)=@_;
    my (%data, $valid, $isvalid, $model, $is_user);
    my $request = Libs::Request->new();

    %data = (
        'login'=> $request->getData('login'),
        'password'=> $request->getData('password')
    );

    $model = Models::Users->new($self->get('model'), $self->get('db'));
    $is_user =  $model->issetUser(\%data);

    if($is_user)
    {
        print "Location: $ENV{'HTTP_REFERER'}\n\n";
    }

}


1;
