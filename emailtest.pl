use strict;
use warnings;

use Email::Send::SMTP::Gmail;



#my $password = get_password();
				 
my $mail=Email::Send::SMTP::Gmail->new( -smtp=>'gmail.com',
                                        -login=>'',
                                        -pass=>'');

print("Connected");
    $mail->send(-to=>'email@domain.com',
                -subject=>'Hello!',
            	-verbose=>'1',
                -body=>'Just testing it'
                    		);

    $mail->bye;

print("done");