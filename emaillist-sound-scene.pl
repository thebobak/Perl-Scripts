#!/usr/bin/perl
  use strict;
  use warnings;
  use Email::Send;
  use Email::Send::Gmail;
  use Email::Simple::Creator;
  use Email::MIME::CreateHTML;
  use Text::CSV;
  use IO::Prompter;

my $username = prompt('Gmail Username:');
my $password = prompt('Password:', -e => '*');


 
## OPEN THE CSV ## 
## my $file = $ARGV[0] or die "Need to get CSV file on the command line\n";

##my $file = '/users/bobak/Desktop/contacts.csv';


my $csv = Text::CSV->new ({
  binary    => 1,
  auto_diag => 1,
  sep_char  => ','    # not really needed as this is the default
});



my $first = "";
my $emailaddress = "";
my $blogname = "";
my $prep = "";



## Send Emails ##

open(my $data, '<:encoding(utf8)', $file) or die "Could not open '$file' $!\n";
 while (my $fields = $csv->getline( $data )) {
  $first = $fields->[0];
  $emailaddress = $fields->[1];
  $blogname = $fields->[2];
     $prep = $fields->[3];


## Email Body ##

my $thebody = <<"BODY";
    <html>
    <body>
    <p>Dear $first:</p>
    <br>
    <p>I am writing to let you know that on May 16th, the DC Listening Lounge is hosting its annual interactive audio installation at the Goethe-Institut.  We hope you can feature this unique, locally-produced event $prep $blogname.</p>
    
    <p>Event details are below.  Feel free to contact me if you have any questions.</p><br>
        
    <p>Thank you,<br>
    Bobak Shafiei<br></p>
    <hr>
    <p><strong>EVENT INFO</strong></p>
    <br>
    <p>The DC Listening Lounge presents...<br><strong>
        "Sound Scene VIII: Play Along"<br>
        May 16th, 2015<br>
        7:30pm-11:30pm<br>
        Goethe-Institut, 812 7th St NW (7th & I St NW)<br>
        &#36;10 advance/&#36;12 at the door<br>
        All ages are welcome and encouraged!</strong></p>

        <br>
        <p><strong>BLURB</strong></p><br>
        <p>What, you don&#39;t get it? Just play along.<p>
        
        <p>The DC Listening Lounge is excited to announce the 2015 edition of Sound Scene, our annual interactive audio exploration. This year we invite you to play along--as a listener, or with sounds of your own. The audio extravaganza will feature live music, interactive audio exhibits, community-noise-making, found sounds, and headphone listening stations.</p>
        
        <p>Please join us for an evening of sound so exciting, your other senses will be jealous.<p><br>
            

        <p>DC Listening Lounge explained:<br>
        Started in 2004, this rag-tag group of audio enthusiasts, found sound collectors, radio journalists, musicians, artists and sound appreciators meets once a month in someone&#39;s living room. We draw no blood and make no demands. Just experimenting, learning and sharing with audio.</p><br>
            
        <p>dclisteninglounge.org</p>
        <img src="/users/bobak/Desktop/poster.png">
        </body>
    </html>
    
BODY


print 'sending to: $emailaddress\n';
     
     
if ($emailaddress eq ''){
  $emailaddress = 'bshafiei@gmail.com';
}
my $email = Email::MIME->create_html(
        header => [
                From => 'bshafiei@gmail.com',
                To => $emailaddress,
                Subject => 'LOCAL EVENT:  Sound Scene VIII',
        ],
        body => $thebody,
        text_body => "Content Error"
);


  my $sender = Email::Send->new(
      {   mailer      => 'Gmail',
          mailer_args => [
              username => $username,
              password => $password,
          ]
      }
  );
  eval { $sender->send($email) };
  die "Error sending email: $@" if $@;


 }
if (not $csv->eof) {
  $csv->error_diag();
}
close $data;
print "done!\n";