#!/usr/bin/perl
use IO::Socket::INET;

# auto-flush on socket
$| = 1;

# creating a listening socket
my $socket = new IO::Socket::INET (
    LocalHost => '192.168.50.4',
    LocalPort => '7777',
    Proto => 'tcp',
    Listen => 10,
    Reuse => 1
);
die "cannot create socket $!\n" unless $socket;
print "server waiting for client connection on port 7777\n";

while(1)
{
    # waiting for a new client connection
    my $client_socket = $socket->accept();

    # get information about a newly connected client
    my $client_address = $client_socket->peerhost();
    my $client_port = $client_socket->peerport();
    print "connection from $client_address:$client_port\n";

    # read up to 2048 characters from the connected client
    my $data = "";
    $client_socket->recv($data, 1048);

    if($data =~ m/(m\d+).*/)
    {
        open(my $fh, ">/vagrant/recieve$1");
        print $fh "$data\n";
        close $fh;
    }

    # write response data to the connected client
    $data = "server received file\n";
    $client_socket->send($data);

    # notify client that response has been sent
    shutdown($client_socket, 1);
}
$socket->close();
