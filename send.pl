#!/usr/bin/perl

$hostname = `/bin/hostname`;
chop $hostname;
$hostname = "$hostname-"."$$";
$filename = "/tmp/stop-send";

$destip	=	"192.168.198.115";
$destination = ("tcp://$destip:9999");

  use ZeroMQ qw/:all/;
  my $ctxt = ZeroMQ::Context->new;
  my $socket = $ctxt->socket(ZMQ_PUSH);
  $socket->connect( "tcp://$destip:9999" );

  while (1) {
  unless ( -e $filename) {
  #my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime;$year += 1900;$mon += 1; my $datetime = sprintf "%02d/%02d/%04d %02d:%02d:%02d", $mon, $mday, $year, $hour, $min, $sec;
  my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime;$year += 1900;$mon += 1; my $datetime = sprintf "%04d-%02d-%02d %02d:%02d:%02d", $year, $mon, $mday, $hour, $min, $sec;
  $DATETIME = $datetime;

  $SourceNodeName = $hostname;

  $count = 0;
  while ($count < 75) {
  $DataType = $count;
 
  $Data = rand(2 ** 32);
  ($Data,$junk) = split (/\./,$Data);
  #$DataEntry = "$DataType"."|"."$Data".",".$DataEntry;
  if ($count ge 1)  {
   $DataEntry = "$DataEntry".","."$DataType".";"."$Data";
#  print "Count = $count ; DataEntry = $DataEntry\n";
   }
  elsif ($count eq 0) {
   $DataEntry = "$DataType".";"."$Data";
#  print "Count = $count ; DataEntry = $DataEntry\n";
   }
   
  $count++;
  }

  $senddata = "$DATETIME|$SourceNodeName|$DataEntry";
  $DataEntry = "";
  $DataType = "";
  $count=0;

  $msg = "$senddata";
  $socket->send($msg);
  #print "-------*\r";
  }
  sleep 5;
  }


