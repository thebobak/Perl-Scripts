use File::Copy;

## Config ##

my $root_folder = "/Users/bobak/Dropbox/_CHEC/2014-2015/_Q3/P4";
my @periods = ("Student Folders");
my $sourcefile = "/Users/bobak/Desktop/Lab - Photo Alterations.psd";
my $destinationfile = "Lab - Photo Alterations.psd";

## Change into root folder ##

chdir($root_folder) or die "folder doesn't exist\n\n";




## Prompt for Input ##

print "\n\n\n";
print "--------------------------------------\n";
print "         Create a New Folder          \n";
print "--------------------------------------\n";
print "\n\n\n";
print "Type a name for the folder:\n";

my $input = <STDIN>;
chomp $input;
my $newfoldername = $input;


## Create the Folder in Each Period ##

foreach $period (@periods) {

    chdir($period) or die "folder doesn't exist\n\n";
    @files = <*>;
    foreach $file (@files) {
        
        if (-d $file)  {
            chdir($file);
            mkdir($newfoldername);
            copy($sourcefile, $destinationfile) or die "Copy failed: $!";
            chdir("../");
        }
        
        
    }
    
    chdir("../");
    
}

