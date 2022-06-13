use strict;
use warnings;

# Simple check script to look for certain keywords.  If all are found that
# the user supplied on the command line then its a PASS.  If anything mismatches
# or is not found then it FAILs.
#
# NOTE: the matching is simple, so if the input is PAS and PASS exists in the
# file, then its a match.  I leave that as a problem for the student to overcome.
#
# ie.  perl ./checkResults.pl /mnt/c/data/output.txt ML_HEARD_ON

my $filename = $ARGV[0];
my @search_strings = @ARGV[1..$#ARGV];

printf "\n";

if (not defined $filename)
{
  die "\nERROR: Missing input filename\n";
}

unless (-e $filename)
{
  die "\nERROR: Input file does not exist <$filename>\n";
}

if (scalar(@search_strings < 1))
{
  die "\nERROR: Need at least one string to search for";
}

open my $fh, '<', $filename or die "Can't open file $!";
my $file_content = do { local $/; <$fh> };

foreach my $search_string (@search_strings) {
  printf "INFO: Searching for <$search_string>\n";
  if ($file_content !~ /$search_string/)
  {
    die "\nFAIL: Could not find <$search_string> in file <$filename> ";
  }
}
printf "\nPASS: Found expected keywords\n";
