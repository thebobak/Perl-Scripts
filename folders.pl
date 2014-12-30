
use warnings; 

@files = <*>;
 foreach $file (@files) {
   
   chdir($file);

# Put the file name in a string variable
# so we can use it both to open the file
# and to refer to in an error message
# if needed.
my $file = "grades.csv";

# Use the open() function to create the file.
unless(open FILE, '>'.$file) {
	# Die with error message 
	# if we can't open it.
	die "nUnable to create $file";
}

# Write some text to the file.

print FILE "Date, Assignment, Points Possible\n";
print FILE "11/5/2013, Computer Parts Lab, 15\n";
print FILE "11/7/2013, Shopping Project 1, 30\n";
print FILE "11/15/2013, Shopping Project 2, 55\n";
print FILE "11/15/2013, Grade Spreadsheet, 10\n";
print FILE "11/22/2013, Photoshop Project 1 (Cloning), 10\n";
print FILE "11/22/2013, Photoshop Project 2 (Composite),15\n";
print FILE "11/22/2013, Photoshop Project 3 (Adjustments),25\n";
print FILE "12/02/2013, Photoshop Project 4 (Pop Art),25\n";
print FILE "12/06/2013, Photoshop Project 6 (Individual),125\n";
print FILE "12/13/2013, Illustrator Project 7 (Name Poster),25\n";
print FILE "11/22/2013, Bonus Points, 5\n";
print FILE "12/13/2013, Hour of Code Bonus, 10\n";


# close the file.
close FILE;

chdir("../");
  
 }
 