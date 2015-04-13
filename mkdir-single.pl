use File::Copy;

## Config ##

<<<<<<< Updated upstream
my $root_folder = "/Users/bobak/Dropbox/_CHEC/2014-2015/_Q3/P4";
my @periods = ("Student Folders");
<<<<<<< HEAD
my @sourcefiles = ("/Users/bobak/Desktop/Entry Slip.docx","/Users/bobak/Desktop/Instructions.docx");
my @destinationfiles = ("Entry Slip.docx", "Instructions.docx");
=======
my $sourcefile = "/Users/bobak/Desktop/Lab - Photo Alterations.psd";
my $destinationfile = "Lab - Photo Alterations.psd";
=======
my $root_folder = "/Users/bobak/Dropbox/_CHEC/2014-2015/Q3/P4/Student\ Folders";
my @periods = ("p1","p2");
>>>>>>> Stashed changes
>>>>>>> origin/master

## Change into root folder ##

chdir($root_folder) or die "folder doesn't exist\n\n";




## Prompt for Input ##

print "\n\n\n";
print "--------------------------------------\n";
print "         Create a New Folder          \n";
print "--------------------------------------\n";
print "\n\n\n";
##print "Type a name for the folder:\n";

##my $input = <STDIN>;
##chomp $input;
my $newfoldername = "FINAL PROJECT";



<<<<<<< Updated upstream
foreach $period (@periods) {

    chdir($period) or die "folder doesn't exist\n\n";
    @folders = <*>;
    foreach $folder (@folders) {
        
        if (-d $folder)  {
            chdir($folder);
            mkdir($newfoldername);
            chdir($newfoldername);

            foreach $sourcefile (@sourcefiles) {
                copy($sourcefile, substr($sourcefile, 21)) or die "Copy failed: $!";
            }
            chdir("../");
        }
        
        chdir("../");
        
    }
=======
@files = <*>;

foreach $file (@files) {
>>>>>>> Stashed changes
    
            if (-d $file)  {
                chdir($file);
                mkdir($newfoldername);
                chdir("../");
            }

    
}


## Create the Folder in Each Period ##

#foreach $period (@periods) {
#
#    chdir($period) or die "folder doesn't exist\n\n";
#    @files = <*>;
#    foreach $file (@files) {
#        
#        if (-d $file)  {
#            chdir($file);
#            mkdir($newfoldername);
#            chdir("../");
#        }
#        
#        
#    }
#    
#    chdir("../");
#    
#}

