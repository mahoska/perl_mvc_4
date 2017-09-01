#user 11
package Models::Users;

use strict;
use warnings FATAL => 'all';

use Data::Dumper;

use Models::DB;

my $db;
my $model;
my $table = 'users';

sub new
{
    my($self, $dbModel, $dbh) = @_;
    $model = $dbModel;
    $db = $dbh;
    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}

sub getUserById
{
    my ($self, $fields, $userId) = @_;

    $model->select($table, \@$fields);
    $model->where('id', $userId);
    $model->limit(1);
    my $sql = $model->execute();
    return $model->getDataHash($sql);
}

sub createUser
{
    my($self, $data) = @_;
    return $model->insert($table, \%$data);
}

sub issetUser
{
    my($self, $login, $password) = @_;

    $model->select($table);
    $model->where('login', $login);
    $model->_where('password', $password);
    $model->limit(1);
    my $res = $model->execute();
    return $model->geNumRows($res);
}

sub updateUser
{
    my ($self, $data, $userId) = @_;
    return $model->update($table, \%$data, $userId);
}

1;
