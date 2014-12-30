use strict;
use warnings; 

# Put the file name in a string variable
# so we can use it both to open the file
# and to refer to in an error message
# if needed.
my $day = 1;
my $month = 03;
my $year = 2014;

for ($i = 0; $i<=31; $i=$i+1) {

	my $file = $year.'-'.$month.'-'.$day.'class-meeting'.'.md';
	print FILE "---\nlayout: full-width\ncategories: calendar\nexcerpt: Photoshop Projects\n---\n";
	$day = $day + 1;
}
# Use the open() function to create the file.
unless(open FILE, '>'.$file) {
	# Die with error message 
	# if we can't open it.
	die "nUnable to create $file";
}

# Write some text to the file.

print FILE "---\nlayout: full-width\ncategories: calendar\nexcerpt: Photoshop Projects\n---\n";




# close the file.
close FILE;