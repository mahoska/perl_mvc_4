#!"C:\xampp\perl\bin\perl.exe"
##!C:\Dwimperl\perl\bin\perl.exe -w


use strict;
use warnings;
use Data::Dumper;
use DBI;

use File::Basename qw(dirname);
use lib dirname(__FILE__).'/Views/';
use lib dirname(__FILE__).'/Libs/';
use lib dirname(__FILE__).'/Controllers/';
use lib dirname(__FILE__).'/Models/';
use CGI::Carp qw(fatalsToBrowser);

use Libs::Router;
use Libs::Configuration;
use Libs::Container;
use Models::DB;
use Libs::Session;

use vars qw($loyout $content $error $auth $user_log $user_id $_auth);


eval
{
    #read config
    my $config = (Libs::Configuration->new())->readConfig('webroot/config.xml');
    #mysqlparams
    my %dbMysql = ('dbType' => $config->{'dbType'}, 'dbName'=>$config->{'dbName'}, 'dbHost'=>$config->{'dbHost'}, 'dbUser'=>$config->{'dbUser'}, 'dbPassword'=> $config->{'dbPassword'});
    my %cookieData = ('cookieName'=>  $config->{'cookieName'}, 'dirPath' => $config->{'cookiePath'});
    #create container
    my $container = Libs::Container->new();

    #save $dbh, $model in container
    my $dbModel = Models::DB->instance(\%dbMysql);
    $container->set('model', $dbModel);
     
    my $dbh  = $dbModel->connect();
    $container->set('db', $dbh);

    #is user login
    my $session =  Libs::Session->new($config->{'cookiePath'}, $config->{'cookieName'}, $config->{'cookieLife'});
    $container->set('session', $session);
    my $is_user = $session->check();

    #create navbar
    $auth  =  ($is_user) ? "visbl" : "displ";
    $_auth = ($is_user) ?  "displ" : "visbl";
    $user_log = $is_user ? $session->get('login') : "";
    $user_id = $is_user ? $session->get('id') : "";
    
    #routing
    my $router = Libs::Router->new();
    my $route = $router->getRoute('route','default/home');

    my $controller =  $route->{'controller'};
    my $action =  $route->{'action'};
    my $params =  $route->{'params'};
 

     require $controller.".pm";
     my $controller_class = "Controllers::$controller";
     $controller = $controller_class->new();
     $controller->setContainer($container);
    
     #if method exists
     if($controller->can($action))
     {
    
         $content = $controller->$action($params);

	 require 'layout.pl';
         print "Content-type: text/html; charset=utf-8\n\n";
         print $loyout;
     }
     else
     {
	 
	  require 'error/page_not_found.pl';
	  print "Content-type: text/html; charset=utf-8\n\n";
	  print $error;
      }
     
};
#fatals
 if($@)
 {	 
     require 'error/error_service.pl';
     print "Content-type: text/html; charset=utf-8\n\n";
     print $error;
 }

1;


#create user_15