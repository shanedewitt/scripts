package Mail::Sendmail;

require 5.0;

our $VERSION = "0.01";

use strict;
use warnings;
 
use parent 'Exporter';

sub sendmail {
    $mail_prog = "/bin/mail";
    
	open MAIL,"|$mail_prog ${i}${EMAIL_SUFFIX}";
	print MAIL "MIME-Version: 1.0\n";
	print MAIL "Content-Type: TEXT/HTML; charset=US-ASCII\n";
	print MAIL "Subject: $temptpType $subject\n", "Reply-to: " . ${"${pkg}::User"} . "${EMAIL_SUFFIX}\n", "$body\n";
	close(MAIL);
    }
