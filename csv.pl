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
 
my $firstname = 0;
my $lastname = 0;
my $folder = "Folder";
my $url = "";


open(my $data, '<:encoding(utf8)', $file) or die "Could not open '$file' $!\n";
while (my $fields = $csv->getline( $data )) {
	$firstname = $fields->[0];
	$folder = $fields->[1];
	$url = $fields->[2];

  	print "Processing:  $firstname $lastname $folder $url\n";
	chdir($folder);
	mkdir("Final-Project");
	chdir("Final-Project");
	if ($url ne "") {
		system("wget","--convert-links","-r","-l15", $url);
	}
	else {
		mkdir("URL-MISSING");
	}

}
if (not $csv->eof) {
  $csv->error_diag();
}
close $data;
print "done!\n";