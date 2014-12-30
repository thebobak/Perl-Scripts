#!/usr/bin/perl
use strict;
use warnings;
 
use Text::CSV;
 
my $file = $ARGV[0] or die "Need to get CSV file on the command line\n";
 
my $csv = Text::CSV->new ({
  binary    => 1,
  auto_diag => 1,
  sep_char  => ','    # not really needed as this is the default
});
 
my $date = "2014-05-12 - ";
my @newfilename = ();
my @oldfilename = ();
my $filename = "";


open(my $data, '<:encoding(utf8)', $file) or die "Could not open '$file' $!\n";
while (my $fields = $csv->getline( $data )) {
	$filename = $date.$fields->[0];
	push (@oldfilename, $filename);




  	print "Processing:  $filename\n";
	

}
if (not $csv->eof) {
  $csv->error_diag();
}
close $data;
print "done!\n";