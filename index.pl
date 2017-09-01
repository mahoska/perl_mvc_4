#!C:\Dwimperl\perl\bin\perl.exe -w

use strict;
use warnings;
use Data::Dumper;

use File::Basename qw(dirname);
use lib dirname(__FILE__).'/Views/';
use lib dirname(__FILE__).'/Libs/';
use lib dirname(__FILE__).'/Controllers/';
use lib dirname(__FILE__).'/Models/';
use lib dirname(__FILE__).'/Helpers/';
use CGI::Carp qw(fatalsToBrowser);
use DBI;

use Libs::Router;
use Libs::Configuration;
use Libs::Container;
use Controllers::securityController;
use Models::DB;

use vars qw($loyout $content $error);

#read config
my $config = (Libs::Configuration->new())->readConfig('webroot/config.xml');
#mysqlparams
my %dbMysql = ('dbType' => $config->{'dbType'}, 'dbName'=>$config->{'dbName'}, 'dbHost'=>$config->{'dbHost'}, 'dbUser'=>$config->{'dbUser'}, 'dbPassword'=> $config->{'dbPassword'});

#create container
my $container = Libs::Container->new();

#save $dbh, $model in container
my $dbModel = Models::DB->instance(\%dbMysql);
$container->set('model', $dbModel);
 
my $dbh  = $dbModel->connect();
$container->set('db', $dbh);

#test pull
  #my $security_controller = Controllers::securityController->new();
  #$security_controller->setContainer($container);
  # $security_controller->isUserAction();


my $router = Libs::Router->new();
my $route = $router->getRoute('route','default/homePage');

my $controller = $route->{'controller'};
my $action = $route->{'action'};

#eval
#{
     require $controller.".pm";
     my $controller_class = "Controllers::$controller";
     $controller = $controller_class->new();
     $controller->setContainer($container);
    
     #if method exists
     if($controller->can($action))
     {
	$content = $controller->$action();
	
	 require 'layout.pl';
         print "Content-type: text/html; charset=utf-8\n\n";
         print $loyout;
     }
     else
     {
	  print "Content-type: text/html; charset=utf-8\n\n";
	  require 'error.pl';
	  print $error;
      }
     
# };
 #if($@)
 #{
 #   print "Content-type: text/html; charset=utf-8\n\n";
 #   #require 'error.pl';
 #   print $error;
  
 #}

