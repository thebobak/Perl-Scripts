use strict;
use warnings;
use WWW::Mechanize;
use LWP::Simple;
use File::Basename;

my $mech = WWW::Mechanize->new( autocheck => 1 );  
$mech->get("http://yahoo.com");

my @mp3links = $mech->find_all_links(    
    tag       => "img",
    url_regex => qr/\.jpg$/,  
);  
print "\n";                 
foreach my $link (@mp3links) {  

    my $url       = $link->url();  
    my $localfile = basename($url);  
    my $localpath = "/Users/bobak/Desktop/LINKS";

    print "$localfile\n";   
    getstore($url, $localpath);   
}  