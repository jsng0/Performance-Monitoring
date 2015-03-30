#!/usr/bin/perl
open(fh, "</vagrant/results") || die;
print "use blink183;\n";
my $count = 1;
my $uptime;
my $user = "\'user1\'";
my $proc;
my @cpu;
push @cpu, 0; #Junk to hold position 0;
while(my $line = <fh>)
{
	chomp $line;
	if($line =~ m/m(\d+),(.*),(\d+)\sProcesses,(\d+\.*\d*).*/)
	{
		$uptime = "\"$2\"";
		$proc = $3;
		push @cpu, $4;
		print "update performanceMonitor set processes=$proc, uptime=$uptime where user=$user;\n";
		$count = $count + 1;
		$user = "\'user$count\'";
	}
	elsif($line =~ m/(\d\d\d\d-\d\d-\d\d \d\d:\d\d)/)
	{
		print "insert into cpu (date, user1, user2, user3, user4) values (\"$1\", $cpu[1], $cpu[2], $cpu[3], $cpu[4]);\n";
	}
}
close fh || die;
