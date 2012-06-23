#!/usr/bin/perl

#    use DBI;
#    use DBD::mysql;
    use ZeroMQ qw/:all/;

#    $mysqluser = "root";
#    $mysqlpass = "zmsst-p4SS";
#    $database = "datastore";

#    $connection = ConnectToMySql($database);

    my $ctxt = ZeroMQ::Context->new;
    #my $socket = $ctxt->socket(ZMQ_REP);
    my $socket = $ctxt->socket(ZMQ_PULL);
    $socket->bind( "tcp://*:9999" );

while (1) {
    $msg = $socket->recv();
    $data = $msg->data;
#    $query = "insert into pingdb ( query_timestamp, host_from, host_to, packets_sent, loss_percent, rtt_min, rtt_ave, rtt_max, rtt_mdev) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
#    $statement = $connection->prepare($query);
#    $statement->execute( $query_timestamp, $host_from, $host_to, $packets_sent, $loss_percent, $rtt_min, $rtt_ave, $rtt_max, $rtt_mdev) ;

  print "data - $data - \n";
}
#--- start sub-routine ------------------------------------------------
sub ConnectToMySql {
#----------------------------------------------------------------------

my ($db) = @_;

# assign the values in the accessDB file to the variables
my $database = "$database";
my $host = "127.0.0.1";
my $userid = "enterpingdata";
my $passwd = "enterpingdata";

# assign the values to your connection variable
my $connectionInfo="dbi:mysql:$db;$host";

# close the accessDB file
close(ACCESS_INFO);

# the chomp() function will remove any newline character from the end of a string
chomp ($database, $host, $userid, $passwd);

# make connection to database
my $l_connection = DBI->connect($connectionInfo,$userid,$passwd);

# the value of this connection is returned by the sub-routine
return $l_connection;

}

#--- end sub-routine --------------------------------------------------

