#!/usr/bin/perl
use IO::Socket::INET;

# auto-flush on socket
$| = 1;

my $name = `hostname`;

system("touch results$NAME");
# create a connecting socket
my $socket = new IO::Socket::INET (
    PeerHost => '192.168.50.4',
    PeerPort => '7777',
    Proto => 'tcp',
);
die "cannot connect to the server $!\n" unless $socket;
print "connected to the server\n";

# data to send to a server
open FILE, "</vagrant/results$name" or die "error opening file\n";
my $line = <FILE>;
my $line2 = <FILE>;
my $line3 = <FILE>;
chomp $name;
chomp $line;
chomp $line2;
chomp $line3;
$socket->send($name.','.$line.','.$line2.','.$line3);
close FILE;

#$socket->send("END");

# notify server that request has been sent
shutdown($socket, 1);

# receive a response of up to 1024 characters from server
my $response = "";
$socket->recv($response, 1048);
print "received response: $response\n";

$socket->close();
