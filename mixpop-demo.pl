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

my $file = '/users/bobak/Desktop/contacts.csv';


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
    This is a test message.
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
