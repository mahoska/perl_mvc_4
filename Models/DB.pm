#user 11
package Models::DB;
use strict;
use warnings FATAL => 'all';

use Data::Dumper;
use DBI;

my $dbh;
my $self;
my $sql;

sub instance
{
    my ($class, $args) = @_;

    $self = $args;
    #$self->{'data'} = ();

    bless $self, $class;
    return $self;
}

sub connect
{
    my ($self) = @_;
    $dbh = DBI->connect("DBI:$self->{'dbType'}:$self->{'dbName'}:$self->{'dbHost'}",$self->{'dbUser'}, $self->{'dbPassword'});
    if ($dbh)
    {
        return $dbh;
    }
}

sub select
{
    my ($self, $table, $params) = @_;
    $self->checkConnect();

    my $param;
    if ($params)
    {
        $param = join(',', @$params);
    }
    else
    {
        $param = '*';
    }

    $sql .= "SELECT $param FROM $table ";
}

sub insert
{
    my($self, $table, $hash) = @_;
    $self->checkConnect();
    my @keys = ();
    my @values = ();

    foreach my $key (keys %{$hash})
    {
        push @keys, $key;
        push @values, "'$hash->{$key}'";
    }

    my $keys = join(', ', @keys);
    my $values = join(', ', @values);

    my $sql = "INSERT INTO $table ($keys) VALUES ($values)";

    my $query = $dbh->prepare($sql);

    if ($query->execute())
    {
        $query->finish();
        return 1;
    }
    return 0;
}

sub update
{
    my($self, $table, $hash, $id) = @_;
    $self->checkConnect();

    my @values =();
    foreach my $key (keys %{$hash})
    {
        push @values , join(' = ', $key, "'$hash->{$key}'");
    }

    my $values = join(', ' , @values);

    my $sql = "UPDATE $table SET $values WHERE id = $id";

    my $query = $dbh->prepare($sql);

    if ($query->execute())
    {
        $query->finish();
        return 1;
    }
    return 0;
}

sub delete
{
    my($self, $table, $id) = @_;
    $self->checkConnect();

    my $sql = "DELETE FROM $table  WHERE id = $id";
    my $query = $dbh->prepare($sql);

    if ($query->execute())
    {
        $query->finish();
        return 1;
    }
    return 0;
}

sub _join
{
    my ($self, $type, $table, $on) = @_;
    $sql .= uc ($type)." JOIN $table ON $on";
}

sub where
{
    my ($self, $key, $value) = @_;
    $sql .= "WHERE $key = '".$value."'";
}

sub _where
{
    my ($self, $key, $value, $type) = @_;
    $sql .= ($type ? uc ($type) : " AND ")."$key = '".$value."'";
}

sub limit
{
    my ($self, $num, $offset) = @_;
    $sql .= " LIMIT $num". ($offset ? ", ".$offset : '');
}

sub orderBy
{
    my ($self, $field, $sort) = @_;
    $sql .= " ORDER BY $field ". ($sort ? $sort : 'ASC');
}

sub execute
{
    my($self) = @_;
    my $query = $dbh->prepare($sql);
    if ($query->execute())
    {
        return $query;
    }
    return 0;
}

sub getDataHash
{
    my($self, $query) = @_;
    return $query->fetchrow_hashref();
}

sub getDataArray
{
    my($self, $query) = @_;
    return $query->fetchrow_arrayref();
}

sub getOne
{
    my($self, $query, $key) = @_;
    my $row = $query->fetchrow_hashref();
    return $row->{$key};
}

sub geNumRows
{
    my($self, $query) = @_;

    if ($query->rows)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

sub checkConnect
{
    my($self) = @_;
    if (!$dbh)
    {
        $dbh = $self->connect();
    }
}

sub DESTROY
{
    if (defined($dbh))
    {
        $dbh->disconnect;
    }
}



1;
