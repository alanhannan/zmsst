#!/usr/bin/perl

    use DBI;
    use DBD::mysql;
    use ZeroMQ qw/:all/;

    $mysqluser = "root";
    $mysqlpass = "zmsst-p4SS";
    $database = "datastore";

    $connection = ConnectToMySql($database);

    my $ctxt = ZeroMQ::Context->new;
    #my $socket = $ctxt->socket(ZMQ_REP);
    my $socket = $ctxt->socket(ZMQ_PULL);
    $socket->bind( "tcp://*:9999" );

while (1) {
    $uniqcounter++;
    $msg = $socket->recv();
    print ".";
    $data = $msg->data;

  #print "$data\n";

# Example Data:  06/23/2012 17:25:54:zmsst-client1:0/449345574,1/44467612,2/1668237485,3/2645816873,4/2073261855,5/2533138434,6/3516164968,7/1166101711,8/2035371443,9/660271616,10/2630833651,11/2071055735,12/126310670,13/3540176018,14/3205795237,15/2626229585,16/1380915358,17/3018785463,18/3435729369,19/3161268367,20/3535825841,21/245465154,22/3896380473,23/3894243164,24/3943662939,25/1110637041,26/3137388862,27/1354958348,28/1228651165,29/455412414,30/1629127926,31/2290334868,32/2103086786,33/1655198325,34/4057249800,35/2331414843,36/1801232908,37/1963813254,38/2823885045,39/1518203537,40/769681040,41/2653994524,42/1283896736,43/380122272,44/1786822494,45/2401152621,46/3610831120,47/2500175201,48/776728036,49/2788062291,50/3649327475,51/1759966321,52/4243681683,53/4289181211,54/2934708837,55/2389565956,56/2231090626,57/1911541917,58/799045490,59/1971677465,60/1096083923,61/578367116,62/2085374681,63/1089853679,64/1923334035,65/1233142031,66/2639262866,67/3088880055,68/738249702,69/3611749776,70/1496026514,71/2652264586,72/1952011683,73/3879240915,74/2839221069


  ($TimeStamp, $SourceNodeName, $DataBundle) = split (/\|/, $data);

  @DataValues = split(",", $DataBundle);

  foreach $val (@DataValues) {
      ($type, $value) = split (/;/, $val);
      #print "$TimeStamp, $SourceNodeName, $type, $value \n";
    $query = "insert into $database ( DataTime, SourceNode, DataType, DataInfo) values (?, ?, ?, ?)";
    #print "$query\n";
    $statement = $connection->prepare($query);
    #print "$statement->execute( $TimeStamp, $SourceNodeName, $type, $value) ;\n";
    $statement->execute( $TimeStamp, $SourceNodeName, $type, $value) ;
      }
  

print "-------$uniqcounter\n";
}
#--- start sub-routine ------------------------------------------------
sub ConnectToMySql {
#----------------------------------------------------------------------

my ($db) = @_;

# assign the values in the accessDB file to the variables
my $database = "$database";
my $host = "127.0.0.1";
my $userid = "$mysqluser";
my $passwd = "$mysqlpass";

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

