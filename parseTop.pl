#!/usr/bin/perl

open(fh, "</vagrant/tempTop$ARGV[0]") || die;
my $flag = 0;
while(<fh>)
{
	if(m/^top.*up\s+(\d+).*(\d+):(\d\d).* (\d+) users, .*/)
	{
		if($flag > 0)
		{
			print "$1 days, $2:$3\n";
		}
	}
	elsif(m/^top.*up\s+(\d+):(\d\d).*/)
	{
		if($flag > 0)
		{
			print "0 days, $1:$2\n";
		}
	}
	elsif(m/^top.*up (\d\d) min.*/)
	{
		if($flag > 0)
		{
			print "0 days, 00:$1\n";
		}
	}
	elsif(m/^top.*up\s+(\d) min.*/)
	{
		if($flag > 0)
		{
			print "0 days, 00:0$1\n";
		}
	}
	elsif(m/^Tasks:\s+(\d+).*(\d+) stopped.*/)
	{
		if($flag > 0)
		{
			print "$1 Processes\n";
		}
	}
	elsif(m/^Cpu.*(\d+\.\d+)\%us.*(\d+\.\d+)\%sy.*/)
	{
		if($flag > 0)
		{
			my $cpu = $1 + $2;
			print "$cpu% CPU Load\n";
		}
		$flag = 1;
	}
}
close fh || die;
