package Libs::Request;

use strict;
use warnings;
use vars qw(%in);
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
$|=1;
ReadParse();
sub isPost;
sub getData;

sub new{
    my $class = ref($_[0])||$_[0];
    return bless{}, $class;
}


  my ($self) = @_;
  $ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
  if ($ENV{'REQUEST_METHOD'} eq "POST")
  {
     return 1;
  }
  return 0;
 }
 
 
   my ($self, $key) = @_;
   return (exists %in->{$key}) ? %in->{$key} : undef;



1;