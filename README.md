zmsst
=====

Zero MQ Send Stats and Test

This project will create a set of objects for measuring storage of data.

The objects are:

1.  Sender

  The Sender is a program meant to simulate a device sending reporting data into the receiver.

2.  Receiver

  The receiver is a program receiving the data and queuing it for storage.

3.  Storage

  The storage may be done directly in a database of some sort.

The format of the data is fixed for this test, with the following structure:

$Timestamp:$SourceNodeName:$DataType:$Data

The $Data can be subdivided into key value pairs.

-----

Requirements / Assumptions:

Ubuntu 12.04-server-64bit
ZeroMQ
Perl

