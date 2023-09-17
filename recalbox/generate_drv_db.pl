#!/usr/bin/perl -w
# C:\Projects\FBNeo\src\dep\scripts
use strict;

my $OutFile = "db_fbneo_games.csv";
my @Filelist;
my %Drivers;
my @Driverlist;
my $SOURCE_FBNEO_DRIVER = "/mnt/c/Projects/FBNeo/src/burn/drv/";

if (not defined $ARGV[0]) {
	@ARGV = (
$SOURCE_FBNEO_DRIVER . "atari",
$SOURCE_FBNEO_DRIVER . "capcom",
$SOURCE_FBNEO_DRIVER . "cave",
# $SOURCE_FBNEO_DRIVER . "channelf",
# $SOURCE_FBNEO_DRIVER . "coleco",
$SOURCE_FBNEO_DRIVER . "cps3",
$SOURCE_FBNEO_DRIVER . "d_parent.cpp",
$SOURCE_FBNEO_DRIVER . "dataeast",
$SOURCE_FBNEO_DRIVER . "galaxian",
$SOURCE_FBNEO_DRIVER . "irem",
$SOURCE_FBNEO_DRIVER . "konami",
# $SOURCE_FBNEO_DRIVER . "megadrive",
$SOURCE_FBNEO_DRIVER . "midway",
# $SOURCE_FBNEO_DRIVER . "msx",
$SOURCE_FBNEO_DRIVER . "neogeo",
# $SOURCE_FBNEO_DRIVER . "nes",
$SOURCE_FBNEO_DRIVER . "pce",
$SOURCE_FBNEO_DRIVER . "pgm",
$SOURCE_FBNEO_DRIVER . "pre90s",
$SOURCE_FBNEO_DRIVER . "psikyo",
$SOURCE_FBNEO_DRIVER . "pst90s",
$SOURCE_FBNEO_DRIVER . "sega",
# $SOURCE_FBNEO_DRIVER . "sg1000",
# $SOURCE_FBNEO_DRIVER . "sms",
$SOURCE_FBNEO_DRIVER . "spectrum",
$SOURCE_FBNEO_DRIVER . "taito",
$SOURCE_FBNEO_DRIVER . "toaplan"
);
	
	# $ARGV[0] = $SOURCE_FBNEO_DRIVER . "atari";
	# $ARGV[1] = $SOURCE_FBNEO_DRIVER . "capcom";
	# $ARGV[2] = $SOURCE_FBNEO_DRIVER . "cave";
	# $ARGV[3] = $SOURCE_FBNEO_DRIVER . "channelf";
	# $ARGV[4] = $SOURCE_FBNEO_DRIVER . "coleco";
	# $ARGV[5] = $SOURCE_FBNEO_DRIVER . "cps3";
	# $ARGV[6] = $SOURCE_FBNEO_DRIVER . "d_parent.cpp";
	# $ARGV[7] = $SOURCE_FBNEO_DRIVER . "dataeast";
	# $ARGV[8] = $SOURCE_FBNEO_DRIVER . "galaxian";
	# $ARGV[9] = $SOURCE_FBNEO_DRIVER . "irem";
	# $ARGV[10] = $SOURCE_FBNEO_DRIVER . "konami";
	# $ARGV[11] = $SOURCE_FBNEO_DRIVER . "megadrive";
	# $ARGV[12] = $SOURCE_FBNEO_DRIVER . "midway";
	# $ARGV[13] = $SOURCE_FBNEO_DRIVER . "msx";
	# $ARGV[14] = $SOURCE_FBNEO_DRIVER . "neogeo";
	# $ARGV[15] = $SOURCE_FBNEO_DRIVER . "nes";
	# $ARGV[16] = $SOURCE_FBNEO_DRIVER . "pce";
	# $ARGV[17] = $SOURCE_FBNEO_DRIVER . "pgm";
	# $ARGV[18] = $SOURCE_FBNEO_DRIVER . "pre90s";
	# $ARGV[19] = $SOURCE_FBNEO_DRIVER . "psikyo";
	# $ARGV[20] = $SOURCE_FBNEO_DRIVER . "pst90s";
	# $ARGV[21] = $SOURCE_FBNEO_DRIVER . "sega";
	# $ARGV[22] = $SOURCE_FBNEO_DRIVER . "sg1000";
	# $ARGV[23] = $SOURCE_FBNEO_DRIVER . "sms";
	# $ARGV[24] = $SOURCE_FBNEO_DRIVER . "spectrum";
	# $ARGV[25] = $SOURCE_FBNEO_DRIVER . "taito";
	# $ARGV[26] = $SOURCE_FBNEO_DRIVER . "toaplan";
	
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "atari";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "capcom";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "cave";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "channelf";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "coleco";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "cps3";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "d_parent.cpp";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "dataeast";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "galaxian";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "irem";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "konami";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "megadrive";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "midway";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "msx";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "neogeo";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "nes";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "pce";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "pgm";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "pre90s";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "psikyo";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "pst90s";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "sega";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "sg1000";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "sms";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "spectrum";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "taito";
	# push $ARGV, $SOURCE_FBNEO_DRIVER . "toaplan";
}

# Process command line arguments
for ( my $i = 0; $i < scalar @ARGV; $i++ ) {
	if ( opendir( INDIR, $ARGV[$i] ) ) {
		# Argument is a dir
		my @dirlist = readdir( INDIR ) or die "\nError: Couldn't read directory $ARGV[$i] $!";
		foreach my $filename ( @dirlist ) {
			if ( $filename =~ /d\w?_.+\.cpp/ ) {
				push( @Filelist, "$ARGV[$i]/$filename" );
			}
		}
		closedir( INDIR );
		next;
	} else {
		# Argument is a file
		push( @Filelist, $ARGV[$i] );
		next;
	}
}

unless ( scalar @Filelist ) {
	die "Usage: $0 <input file|dir> [<input file|dir>...]\n\n";
}

# Build a list of all drivers
foreach my $filename ( @Filelist ) {
	open( INFILE, $filename ) or die "\nError: Couldn't read $filename $!";
	while ( my $line = <INFILE> ) {

		# Strip C++ style // comments
		if ( $line =~ /(.*?)\/\// ) {
			$line = $1;
		}

		# Strip C style /* comments */
		if ( $line =~ /(.*)\/\*/ ) {
			my $temp = $1;
			while ( $line and !($line =~ /\*\/(.*)/) ) {
				$line = <INFILE>;
			}
			$line = $temp;
			substr( $line, length( $line ) ) = $1;
		}

		# get included .cpp.h files in the same directory
		if ( $line =~ /^\s*#include "d_\w*.h"/ ) {
			$line =~ /^\s*#include "(.*)"/;
			my $newfile = $1;
			$filename =~ /(.*[\/\\])[^\/\\]/;
			push( @Filelist, "$1$newfile" );
		}

		if ( $line =~ /struct\s+BurnDriver([D|X]?)\s+(\w+)(.*)/ ) {

			# We're at the start of a BurnDriver declaration

			# Create a hash key with the name of the structure,
			# Fill the first element of the array with the driver status
			my $name = $2;
			$Drivers{$name}[0] = "$1";

			# Read the Burndriver structure into a variable
			my $struct = $3;
			do {
				$line = <INFILE>;

				# Strip C++ style // comments
				if ( $line =~ /(.*?)\/\// ) {
					$line = $1;
				}

				substr( $struct, length( $struct ) ) = $line;
			} until $line =~ /;/;

			# Strip anything after the ;
			$struct =~ /(.*;)/s;
			$struct = $1;

			# Strip C style /* comments */
			while ( $struct =~ /(.*)\/\*.*?\*\/(.*)/s ) {
				$struct = $1;
				substr( $struct, length( $struct ) ) = $2;
			}

			# We now have the complete Burndriver structure without comments

			# Extract the strings from the variable
			$struct =~ /\s*(".*"|null|0)\s*,\s*(".*"|null|0)\s*,\s*(".*"|null|0)\s*,\s*(".*"|null|0)\s*,\s*(".*"|null|0)\s*,\s*(".*"|null|0)\s*,\s*(".*"|null|0)\s*,\s*(".*"|null|0)\s*,\s*(".*"|null|0),\s*(L".*"|null|0)\s*,\s*(L".*"|null|0)\s*,\s*(L".*"|null|0)\s*,\s*(L".*"|null)\s*,\s*(\d|[^,]*)/si;

			$Drivers{$name}[1] = $1;						# Name
			$Drivers{$name}[2] = $6;						# Full name
			$Drivers{$name}[3] = $7;						# Remarks
			$Drivers{$name}[4] = $8;						# Company
			$Drivers{$name}[5] = $9;						# Hardware
			$Drivers{$name}[6] = $5;						# Year of release
			$Drivers{$name}[7] = $2;						# Parent

			if ( $14 ne "1" && ($14 =~ /BDF_GAME_WORKING/) == 0 ) {			# Working status
				$Drivers{$name}[8] = "NOT WORKING";
			} else {
				$Drivers{$name}[8] = "";
			}
			$Drivers{$name}[9] = "$filename";								# Filename

			# Convert NULL/null/0 to empty string or remove quotes
			foreach $line ( @{$Drivers{$name}} ) {
				if ( $line =~ /^(null|NULL|0)/ ) {
					$line = "";
				} else {
					$line =~ /(^"?)(.*)\1/;
					$line = $2;
				}
			}

			# We only want the 1st name
			$Drivers{$name}[2] =~ /(.*)\\0.*/;
			$Drivers{$name}[2] = $1;

			if ( $struct =~ /BDF_PROTOTYPE/ ) {
				$Drivers{$name}[8] = "$Drivers{$name}[8]" . ".Prototype";
			}
			if ( $struct =~ /BDF_BOOTLEG/ ) {
				$Drivers{$name}[8] = "$Drivers{$name}[8]" . ".Bootleg";
			}
			if ( $Drivers{$name}[3] ne "" ) {
				$Drivers{$name}[8] = "$Drivers{$name}[8]" . ".$Drivers{$name}[3]";
			}
		}
	}
	close( INFILE );
}

# Sort the list of drivers using the decorated game name as the key
# Make the sort order more predictive by adding the driver name
@Driverlist = sort {
	lc( $Drivers{$a}[2] . $Drivers{$a}[1] ) cmp lc( $Drivers{$b}[2] . $Drivers{$b}[1] );
} keys %Drivers;

if ( $OutFile ) {

	open( OUTFILE, ">$OutFile" ) or die "\nError: Couldn't open OUTPUT file $OutFile $!";

	print "Generating gamelist.txt...\n";
	print OUTFILE "sep=|\x0d\x0a";
	# print OUTFILE "Status";
	print OUTFILE "|Name";
	print OUTFILE "|Full name";
	# print OUTFILE "|Remarks";
	print OUTFILE "|Company";
	print OUTFILE "|Hardware";
	print OUTFILE "|Year of release";
	print OUTFILE "|Parent";
	print OUTFILE "|Working Status";
	# print OUTFILE "|Filename";
	# print OUTFILE "|Extra Full name";
	print OUTFILE "\x0d\x0a";

	my $Text;

	foreach my $name ( @Driverlist ) {
		my $NeededSpaces;

		# print OUTFILE "$Drivers{$name}[0]";
		print OUTFILE "|$Drivers{$name}[1]";
		print OUTFILE "|$Drivers{$name}[2]";
		# print OUTFILE "|$Drivers{$name}[3]";
		print OUTFILE "|$Drivers{$name}[4]";
		print OUTFILE "|$Drivers{$name}[5]";
		print OUTFILE "|$Drivers{$name}[6]";
		print OUTFILE "|$Drivers{$name}[7]";
		print OUTFILE "|$Drivers{$name}[8]";
		# print OUTFILE "|$Drivers{$name}[9]";
		# print OUTFILE "|$Drivers{$name}[10]";
		print OUTFILE "\x0d\x0a";
	}

	close( OUTFILE );
}
