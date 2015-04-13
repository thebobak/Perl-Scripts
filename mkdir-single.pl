use File::Copy;

## Config ##

my $root_folder = "/Users/bobak/Dropbox/_CHEC/2014-2015/_Q3/P4";
my @periods = ("Student Folders");
my @sourcefiles = ("/Users/bobak/Desktop/Entry Slip.docx","/Users/bobak/Desktop/Instructions.docx");
my @destinationfiles = ("Entry Slip.docx", "Instructions.docx");

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


## Create the Folder in Each Period ##

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
    
    chdir("../");
    
}

