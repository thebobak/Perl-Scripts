use File::Copy;

$file_to_get = "/Users/bobak/Desktop/Apples-to-Apples.xlsx";
$destination_filename = "Apples-to-Apples.xlsx";
@files = <*>;
 foreach $file (@files) {
   
   chdir($file);
   copy($file_to_get, $destination_filename) or die "copy failed";
   chdir("../");
   
  
 }
 
 

 