use File::Copy;

$file_to_get = "/Users/bobak/Desktop/Apples-to-Apples.xlsx";
$destination_filename = "Apples-to-Apples.xlsx";
@files = <*>;
 foreach $file (@files) {
   
   chdir($file);
   copy($file_to_get, $destination_filename) or die "copy failed";
   chdir("../");
   
  
 }



@names = (

"Lesly Arevalo",
"Ademir Bautista",
"Maria Ester Bravo-Huezo",
"Destiny Bumpers",
"Pedro Casarrubia",
"Lester Castillo",
"Jocelyn Cruz",
"Marlene Gutierrez",
"Alisha	Henley",
"Stephanie Hernandez",
"Jing Huang",
"Biyeshi Kumsa",
"Kevin Lara",
"Bianca Moreno-Martinez",
"Jonathan Palacios",
"Armani Person",
"Agustina Pineda",
"Christian Ray",
"Alexis Reddock",
"Gabriel Siaw",
"Randi Smith",
"Josue Torres",
"Katherine Ventura",
"Jose Villatoro",
);

foreach $name (@names) {
    mkdir($name);
}
 
 

 