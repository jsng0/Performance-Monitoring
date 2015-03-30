#!/usr/bin/perl

open(fh1, "</vagrant/recievem1") || die;
while(my $line = <fh1>)
{
	chomp $line;
	print "$line\n";
}
open(fh2, "</vagrant/recievem2") || die;
while(my $line = <fh2>)
{
	chomp $line;
	print "$line\n";
}
open(fh3, "</vagrant/recievem3") || die;
while(my $line = <fh3>)
{
	chomp $line;
	print "$line\n";
}
open(fh4, "</vagrant/recievem4") || die;
while(my $line = <fh4>)
{
	chomp $line;
	print "$line\n";
}
close fh1 || die;
close fh2 || die;
close fh3 || die;
close fh4 || die;

$line = `date`;
my $day;
my $month;
my $year;
my $time;
if($line =~ m/.*(\d+)\s+(\d\d:\d\d):\d\d.*(\d\d\d\d)/)
{
	$year = $3;
	$day = $1;
	$time = $2;
	if($day < 10)
	{
		$day = "0$1";
	}
}
if($line =~ m/Jan/) { $month = "01"; }
if($line =~ m/Feb/) { $month = "02"; }
if($line =~ m/Mar/) { $month = "03"; }
if($line =~ m/Apr/) { $month = "04"; }
if($line =~ m/May/) { $month = "05"; }
if($line =~ m/Jun/) { $month = "06"; }
if($line =~ m/Jul/) { $month = "07"; }
if($line =~ m/Aug/) { $month = "08"; }
if($line =~ m/Sep/) { $month = "09"; }
if($line =~ m/Oct/) { $month = "10"; }
if($line =~ m/Nov/) { $month = "11"; }
if($line =~ m/Dec/) { $month = "12"; }
print "$year-$month-$day $time\n";
