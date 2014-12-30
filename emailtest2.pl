#!/usr/bin/perl
  use strict;
  use warnings;
  use Email::Send;
  use Email::Send::Gmail;
  use Email::Simple::Creator;
  use Email::MIME::CreateHTML;
  use Text::CSV;
 
## OPEN THE CSV ## 
my $file = $ARGV[0] or die "Need to get CSV file on the command line\n";
 
my $csv = Text::CSV->new ({
  binary    => 1,
  auto_diag => 1,
  sep_char  => ','    # not really needed as this is the default
});

my $first = "";
my $emailaddress = "";
my $webcomment = "";
my $webgrade = "";
my $entryslip = "";
my $presentation = "";
my $finalgrade = "";
my $prograde = "";
my $procomment = "";
my $comment = "";





## Send Emails ##

open(my $data, '<:encoding(utf8)', $file) or die "Could not open '$file' $!\n";
while (my $fields = $csv->getline( $data )) {
  $first = $fields->[0];
  $emailaddress = $fields->[1];
  $webcomment = $fields->[2];
  $webgrade = $fields->[3];
  $entryslip = $fields->[4];
  $presentation = $fields->[5];
  $finalgrade = $fields->[6];
  $prograde = $fields->[7];
  $procomment = $fields->[8];
  $comment = $fields->[9];
## Email Body ##

my $thebody = <<HTML;
 <html>
 <head>
 <title>Final Grades</title>
 </head>
 <body>
 <h1>Final Grades</h1>
 <h4>Dear $first,</h4>
 <p>Below you will find your final grade for the class and feedback on your work.  I will be accepting revisions until Friday, April 4.  If you believe something to be in error, please email me or stop by <strong>after school</strong>.</p>
 <p>I hope you enjoy the rest of the year here at CHEC and remember, you are always welcome to contact me if you need anything!</p>
 <p>Sincerely,<br>Mr. Shafiei</p>
 <hr>
 <h2>Your Final Grade:  <font color="#ff0000">$finalgrade</font></h2>
 <hr>
 <h4>Website Project Grade:  <font color="#ff0000">$webgrade</font></h4>
 <h5>Comments</h5>
 <p>$webcomment</p>
 <hr>

 <h4>Professionalism Grade:  <font color="#ff0000">$prograde</font></h4>
 <h5>Comments</h5>
 <p>$procomment</p>
 <hr>

 <h4>Entry Slip Received:  <font color="#ff0000">$entryslip</font></h4>
 <h4>Presentation Complete:  <font color="#ff0000">$presentation</font></h4>
 <p><em>Please note, this could make the difference between a "minus" or a "plus" on your grade!</em></p>
 <hr>
 <h5>Final Comments from Mr. S:</h5>
 <p>$comment</p>


 </body>
HTML

print $emailaddress;


if ($emailaddress eq ''){
  $emailaddress = '';
}
my $email = Email::MIME->create_html(
        header => [
                From => '',
                To => $emailaddress,
                Subject => 'Final Grades',
        ],
        body => $thebody,
        text_body => "Content Error"
);


  my $sender = Email::Send->new(
      {   mailer      => 'Gmail',
          mailer_args => [
              username => '',
              password => '',
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