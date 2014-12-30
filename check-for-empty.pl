use File::Copy;

my @folderlist = ("Apples-to-Apples", "Shopping Project", "App Inventor", "App Inventor Final", "Other Assignments");

sub is_folder_empty {
    my $dirname = shift;
    opendir(my $dh, $dirname) or die "Not a directory";
    return scalar(grep { $_ ne "." && $_ ne ".." } readdir($dh)) == 0;
}


@files = <*>;
 foreach $file (@files) {
   
     chdir($file);
     foreach $folder (@folderlist) {
         chdir($folder);
         if (is_folder_empty($folder)) {
             print "empty\n";
         }
         chdir("../");
         
     }
     chdir("../");
   
  
 }
 
 

 