#!/usr/bin/perl

$destip	=	"192.168.198.115";
$destination = ("tcp://$destip:9999");

  use ZeroMQ qw/:all/;
  my $ctxt = ZeroMQ::Context->new;
  my $socket = $ctxt->socket(ZMQ_PUSH);
  $socket->connect( "tcp://$destip:9999" );
  $senddata = "TEST";
  $msg = "TEST";
  $socket->send($msg);
