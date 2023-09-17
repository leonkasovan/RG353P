#!/usr/bin/perl -w
# C:\Projects\FBNeo\src\dep\scripts
use strict;

my $OutFile = "db_fbneo_games.csv";
my @Filelist;
my %Drivers;
my @Driverlist;

if (not defined $ARGV[0]) {
	@ARGV = (
"/mnt/c/Projects/FBNeo/src/burn/drv/atari",
"/mnt/c/Projects/FBNeo/src/burn/drv/capcom",
"/mnt/c/Projects/FBNeo/src/burn/drv/cave",
# "/mnt/c/Projects/FBNeo/src/burn/drv/channelf",
# "/mnt/c/Projects/FBNeo/src/burn/drv/coleco",
"/mnt/c/Projects/FBNeo/src/burn/drv/cps3",
"/mnt/c/Projects/FBNeo/src/burn/drv/d_parent.cpp",
"/mnt/c/Projects/FBNeo/src/burn/drv/dataeast",
"/mnt/c/Projects/FBNeo/src/burn/drv/galaxian",
"/mnt/c/Projects/FBNeo/src/burn/drv/irem",
"/mnt/c/Projects/FBNeo/src/burn/drv/konami",
# "/mnt/c/Projects/FBNeo/src/burn/drv/megadrive",
"/mnt/c/Projects/FBNeo/src/burn/drv/midway",
# "/mnt/c/Projects/FBNeo/src/burn/drv/msx",
"/mnt/c/Projects/FBNeo/src/burn/drv/neogeo",
# "/mnt/c/Projects/FBNeo/src/burn/drv/nes",
"/mnt/c/Projects/FBNeo/src/burn/drv/pce",
"/mnt/c/Projects/FBNeo/src/burn/drv/pgm",
"/mnt/c/Projects/FBNeo/src/burn/drv/pre90s",
"/mnt/c/Projects/FBNeo/src/burn/drv/psikyo",
"/mnt/c/Projects/FBNeo/src/burn/drv/pst90s",
"/mnt/c/Projects/FBNeo/src/burn/drv/sega",
# "/mnt/c/Projects/FBNeo/src/burn/drv/sg1000",
# "/mnt/c/Projects/FBNeo/src/burn/drv/sms",
"/mnt/c/Projects/FBNeo/src/burn/drv/spectrum",
"/mnt/c/Projects/FBNeo/src/burn/drv/taito",
"/mnt/c/Projects/FBNeo/src/burn/drv/toaplan"
);
	
	# $ARGV[0] = "/mnt/c/Projects/FBNeo/src/burn/drv/atari";
	# $ARGV[1] = "/mnt/c/Projects/FBNeo/src/burn/drv/capcom";
	# $ARGV[2] = "/mnt/c/Projects/FBNeo/src/burn/drv/cave";
	# $ARGV[3] = "/mnt/c/Projects/FBNeo/src/burn/drv/channelf";
	# $ARGV[4] = "/mnt/c/Projects/FBNeo/src/burn/drv/coleco";
	# $ARGV[5] = "/mnt/c/Projects/FBNeo/src/burn/drv/cps3";
	# $ARGV[6] = "/mnt/c/Projects/FBNeo/src/burn/drv/d_parent.cpp";
	# $ARGV[7] = "/mnt/c/Projects/FBNeo/src/burn/drv/dataeast";
	# $ARGV[8] = "/mnt/c/Projects/FBNeo/src/burn/drv/galaxian";
	# $ARGV[9] = "/mnt/c/Projects/FBNeo/src/burn/drv/irem";
	# $ARGV[10] = "/mnt/c/Projects/FBNeo/src/burn/drv/konami";
	# $ARGV[11] = "/mnt/c/Projects/FBNeo/src/burn/drv/megadrive";
	# $ARGV[12] = "/mnt/c/Projects/FBNeo/src/burn/drv/midway";
	# $ARGV[13] = "/mnt/c/Projects/FBNeo/src/burn/drv/msx";
	# $ARGV[14] = "/mnt/c/Projects/FBNeo/src/burn/drv/neogeo";
	# $ARGV[15] = "/mnt/c/Projects/FBNeo/src/burn/drv/nes";
	# $ARGV[16] = "/mnt/c/Projects/FBNeo/src/burn/drv/pce";
	# $ARGV[17] = "/mnt/c/Projects/FBNeo/src/burn/drv/pgm";
	# $ARGV[18] = "/mnt/c/Projects/FBNeo/src/burn/drv/pre90s";
	# $ARGV[19] = "/mnt/c/Projects/FBNeo/src/burn/drv/psikyo";
	# $ARGV[20] = "/mnt/c/Projects/FBNeo/src/burn/drv/pst90s";
	# $ARGV[21] = "/mnt/c/Projects/FBNeo/src/burn/drv/sega";
	# $ARGV[22] = "/mnt/c/Projects/FBNeo/src/burn/drv/sg1000";
	# $ARGV[23] = "/mnt/c/Projects/FBNeo/src/burn/drv/sms";
	# $ARGV[24] = "/mnt/c/Projects/FBNeo/src/burn/drv/spectrum";
	# $ARGV[25] = "/mnt/c/Projects/FBNeo/src/burn/drv/taito";
	# $ARGV[26] = "/mnt/c/Projects/FBNeo/src/burn/drv/toaplan";
	
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/atari";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/capcom";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/cave";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/channelf";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/coleco";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/cps3";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/d_parent.cpp";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/dataeast";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/galaxian";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/irem";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/konami";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/megadrive";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/midway";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/msx";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/neogeo";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/nes";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/pce";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/pgm";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/pre90s";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/psikyo";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/pst90s";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/sega";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/sg1000";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/sms";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/spectrum";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/taito";
	# push $ARGV, "/mnt/c/Projects/FBNeo/src/burn/drv/toaplan";
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

			$Drivers{$name}[10] = $Drivers{$name}[2];
			if ( $struct =~ /BDF_PROTOTYPE/ || $struct =~ /BDF_BOOTLEG/ || $Drivers{$name}[3] ne "" ) {
				$Drivers{$name}[10] = "$Drivers{$name}[10]" . " [";
			}
			if ( $struct =~ /BDF_PROTOTYPE/ ) {
				$Drivers{$name}[10] = "$Drivers{$name}[10]" . "Prototype";
				if ( $struct =~ /BDF_BOOTLEG/ || $Drivers{$name}[3] ne "" ) {
					$Drivers{$name}[10] = "$Drivers{$name}[10]" . ", ";
				}
			}
			if ( $struct =~ /BDF_BOOTLEG/ ) {
				$Drivers{$name}[10] = "$Drivers{$name}[10]" . "Bootleg";
				if ( $Drivers{$name}[3] ne "" ) {
					$Drivers{$name}[10] = "$Drivers{$name}[10]" . ", ";
				}
			}
			if ( $Drivers{$name}[3] ne "" ) {
				$Drivers{$name}[10] = "$Drivers{$name}[10]" . "$Drivers{$name}[3]";
			}
			if ( $struct =~ /BDF_PROTOTYPE/ || $struct =~ /BDF_BOOTLEG/ || $Drivers{$name}[3] ne "" ) {
				$Drivers{$name}[10] = "$Drivers{$name}[10]" . "]";
			}
		}
	}
	close( INFILE );
}

# Sort the list of drivers using the decorated game name as the key
# Make the sort order more predictive by adding the driver name
@Driverlist = sort {
	lc( $Drivers{$a}[10] . $Drivers{$a}[1] ) cmp lc( $Drivers{$b}[10] . $Drivers{$b}[1] );
} keys %Drivers;

if ( $OutFile ) {

	open( OUTFILE, ">$OutFile" ) or die "\nError: Couldn't open OUTPUT file $OutFile $!";

	print "Generating gamelist.txt...\n";
	print OUTFILE "sep=|\x0d\x0a";
	print OUTFILE "Status";
	print OUTFILE "|Name";
	print OUTFILE "|Full name";
	print OUTFILE "|Remarks";
	print OUTFILE "|Company";
	print OUTFILE "|Hardware";
	print OUTFILE "|Year of release";
	print OUTFILE "|Parent";
	print OUTFILE "|Working Status";
	# print OUTFILE "|Filename";
	print OUTFILE "|Extra Full name";
	print OUTFILE "\x0d\x0a";

	my $Text;

	foreach my $name ( @Driverlist ) {
		my $NeededSpaces;

		print OUTFILE "$Drivers{$name}[0]";
		print OUTFILE "|$Drivers{$name}[1]";
		print OUTFILE "|$Drivers{$name}[2]";
		print OUTFILE "|$Drivers{$name}[3]";
		print OUTFILE "|$Drivers{$name}[4]";
		print OUTFILE "|$Drivers{$name}[5]";
		print OUTFILE "|$Drivers{$name}[6]";
		print OUTFILE "|$Drivers{$name}[7]";
		print OUTFILE "|$Drivers{$name}[8]";
		# print OUTFILE "|$Drivers{$name}[9]";
		print OUTFILE "|$Drivers{$name}[10]";
		print OUTFILE "\x0d\x0a";
	}

	close( OUTFILE );
}
