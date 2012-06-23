#!/usr/bin/perl

$destination = ("tcp://127.0.0.1:9999");

    use ZeroMQ qw/:all/;
    my $ctxt = ZeroMQ::Context->new;
    my $socket = $ctxt->socket(ZMQ_PUSH);
    $socket->connect( "tcp://$destination:9999" );

      $socket->send("$senddata");


