#!/bin/perl

use strict;
#strict is helpful in making program less error prone WE HAVE TO USE my for Declaring Variable 
use warnings;
#HELP TO FIND TYPING MISTAKES


use List::Util qw(min);# BEST METHOD IMPLEMENT MIN FUNCTION HERE
#if we want to use CPAN LIBRARY LIKE OTHERWISE I IMPLEMENTED MINIMUM FUNCTION ALSO

#FOR FILE I/O OPERATIONS
open( my $input1 , "<DICTIONARY.txt") or die "PLEASE CHECK AGAIN , FILE DOES NOT EXISTS , MAYBE WRONG NAME "; 
#WE CAN USE HERE MULTIPLE DICTIONARY I HAVE GIVEN 

#DEFINING HASHDICTIONARY
my %hashDictionary;

#TAKING INPUT FROM THE FILE OPENED
while(<$input1>) #READING UNTIL THE FILE FINISHES
{
  chomp;
#DELETING THE NEW LINE CHARACTER PRESENT
#STORING THE WORDS IN HASH DICTIONARY
#$_ REFERS TO THE SPECIAL VARIABLE IT CONTAINS DEFAULT INPUT
  $hashDictionary{"$_"} =$_;
}
close $input1;
#CLOSING THE FILE

#TAKING INPUT FROM USER
printf "Please Enter Your Input : \n";

#TAKING INPUT THE USER GIVEN INPUT IS STORED IN VARIABLE $input
my $input = <STDIN>;
chomp $input;#DELETING THE NEW LINE CHARACTER PRESENT

#MAKING FINAL STRING 
my $finalOutput="";
#STORING THE INPUT OF USER IN $a SO THAT ON DOING OPERATIONS ON $input IT DIDN'T CHANGED
my $a = $input;

#SPLITING AND STORING THE WORDS ON BASIS OF SPACE IN AN ARRAY ->@array1
my @array1 = split(' ',$a);
#CREATING ANOTHER ARRAY
my @array2;

#DEFINING HASH MAP FOR HAVING EDIT DISTANCE AND WORD INSIDE IT
my %hashWordToDistance;
printf "\n";

foreach(@array1)  #IT WILL CHECK FOR EVERY WORD PRESENT IN THE ARRAY array1
{
#IF THE WORD ALREADY EXISTS IN THE HASH DICTIONARY THAN UT IS CORRECT WORD SO NEED TO GIVE SUGGESTION
   if(exists $hashDictionary{$_})
   {
      $finalOutput = $finalOutput.$_." ";  #STORING THE WORD AS IT IS IN THE FINAL STRING 
     #SINCE THE WORD IS MATCHING WITH THE WORD IN DICTIONARY SO WE ARE NOT PERFORMING ANY OPERATION ON IT 
   }  #ELSE IF THE WORD DOES NOT EXISTS IN HASH DICTIONARY
   elsif (!(exists $hashDictionary{$_}))
   {
   #PROMPTING TO USER THAT IT MAY BE ERROR HERE IN THIS WORD
     printf $_."^".": Please Check This Word Again.\n";
     # $_ IS USED FOR DEFAULT VALUE OF THE WORD OF ARRAY
     my $lenght4 = length($_);  #STORING THE LENGHT IT MAYBE USEFUL LATER
     my $input4 = $_;#STORING THE VALUE OF THE INCORRECT WORD 
     #ASKING USER WHETHER HE WANT TO CHANGE VALUE OR NOT 
     printf "Do You Want Suggestion ? Press Y / y to view Suggestions else Press any other Key to Continue : ";
     #TAKING INPUT FROM USER 
     my $opt = <STDIN>;
     
     chomp $opt;
     #DELETING THE NEW LINE CHARACTER PRESENT
     $opt = lc $opt;
     #CHANGING THE CHAR INTO LOWER CASE WE WILL NOT REQUIRE MORE CASES JUST WE CAN USE y
     if( $opt =~ m[y]) #USED FOR MATCHING
     {
     
       printf "Suggestions are -> ";
       my $input3 = $_;
       my $lenghtA =  length($input3) ;
        #CREATING AN ARRAY AS QWERTY AND STORING DISTANCE IN THAT ARRAY
       my @QWERTY;
       my $qw = 0;
       
       #NOW CHECKING EACH WORD WITH THE WORDS OF THE DICTIONARY
       foreach my $key (keys %hashDictionary)
       { 
       #STORING THE KEY AND SAVING THE KEYS AS word variable 
         my $word = $key;
         #now STORING THE WORD OF DICTIONARY AS KEY AND VALUE AS THE EDIT DISTANCE 
         $hashWordToDistance{"$word"} = NearestString($word,$input4);
         #nearestString is A FINCTION THAT GIVE THE EDIT DISTANCE
         
         #printf NearestString($word,$input4)."\n";#JUST FOR CHECK IT IS  CORRECT OR NOT 
         $QWERTY[$qw] = NearestString($word,$input4);
         $qw = $qw+1;#FOR NORMAL INCREMENT 
       }
       my @ARRAYN = sort @QWERTY; #SORTING THE ARRAY
       # AND STORING THE ARRAY IN ANOTHER IT WILL HAVE THE LOWEST EDIT DISTANCE IN ZERO INDEX
       
       my @ARRAYN2; #CREATING ONE MORE ARRAY FOR STORING THE WORDS THAT ARE AT LOWEST EDIT DISTANCE 
       my $v = 0;
       #JUST FOR CHECK WHETHER ARRAYN[0] GIVES THE CORRECT VALUE OF LOWEST EDIT DISTANCE OR NOT
       #printf $ARRAYN[0]."\n";
       #NOW SEEING THE WORDS PRESENT AT THAT DISTANCE WE AGAIN SEE EVERY WORD IN LOOP
       foreach my $key2 (keys %hashDictionary)
       { 
         my $word2 = $key2;
         #IF THE DISTANCE OF THE WORD MATCHED THEN WE ARE STORING INTO ARRAY ARRAYN2 THE CORRESPONDING WORD
         #GIVNG SUGGESTIONS TO USER WHICH WORD U WANT IF SIMILIAR EDIT DISTANCES OF MORE WORDS 
         if ($hashWordToDistance{"$word2"} eq $ARRAYN[0])
         {
            $ARRAYN2[$v] = $word2;
            printf $v.") ".$word2." ";
            $v = $v+1;
         }
       }
       my $f = $v-1;
       printf "\n";
      # printf "If Not Satisfied By Suggestion Please Press Number More Than Any Index To Work With Your Given Word\n"; 
     printf "To Replace / Substitute the Word \n";
       printf "Press The Index Shown in Suggestion To Replace the word by that Word : ";
       #TAKING THE INDEX FROM WHICH U WANT TO REPLACE
       my $valueInput = <STDIN>;
       chomp $valueInput;
        #  printf "$valueInput\n";
        #  printf "$v\n";
        #  printf "$ARRAYN2[$valueInput]\n";
       #NOW CHECKING IF THE INDEX MORE THEN DONT CHANGE THE WORD ELSE CHANGE THE WORD WHOSE INDEX MATCHES WITH
         $finalOutput = $finalOutput.$ARRAYN2[$valueInput]." ";
      #  if($valueInput ge $v)
      #  {
      #  #PROMPTING USER CHOOSED INCOORECT INDEX SO WORD WILL NOT CHANGE
      #  print "YOU HAVE CHOOSEN TO WORK WITH SAME NUMBER. YOUR INPUT WORD WILL REMAIN SAME . NO MODIFICATION\n";
      # #  $finalOutput = $finalOutput.$input4." ";
      #  }
      #  else
      #  {
      #    #NOW CONCATENETING WITH THE REPLACED WORD
       printf "REPLACED SUCCESSFULLY\n";
      #  }
     }
     else
     {
     #IF USER DONT WANT ANY SUGGESTION
      printf "Ignoring the Spelling Mistake . Assuming You Have Entered Correctly\n\n";
      $finalOutput = $finalOutput.$input4." ";
     }
     printf "\n";
   }
}
printf "HENCE YOUR MODIFIED/UNMODIFIED INPUT WITH EQUAL SPACES IS : \n".$finalOutput."\n";
#PRINTING OUT THE MODIFIED INPUT AT LAST


#levenshtein distance FUNCTION
sub NearestString
{
#STORING THE ARGUMENTS INTO q1 and q2
  my $q1 = $_[0];
  my $q2 = $_[1];
  my $l1 = length($q1);
  my $l2 = length($q2);
  my @A1 = split('',$q1);
  #SPLITTING THE WORDS INTO CHAR ARRAY
  my @A2 = split('',$q2);
  #SPLITTING THE WORDS INTO CHAR ARRAY
  my @Array2D;
  #2D ARRAY THAT WILL HELP TO FIND EDIT DISTANCE
  for (my $io = 0 ; $io <= @A1 ; $io = $io +1)
          {
           $Array2D[$io][0] = $io;
           #STORING THE NUMBER WISE CORRESPONDING TO THE LETTERS OF WORD1
          }
          for (my $io2 = 0 ; $io2 <= @A2 ; $io2 = $io2 +1)
          {
           $Array2D[0][$io2] = $io2;
           #STORING THE NUMBER WISE CORRESPONDING TO THE LETTERS OF WORD1
          }
          for ( my $i = 1; $i <= @A1; $i = $i + 1 )
          {
             for ( my $j = 1; $j <= @A2; $j = $j + 1 )
              {
                my $value;
                  if( $A1[$i -1] eq $A2[ $j -1])
                  {
                    $value = 0;
                  }
                  else
                  {
                    $value = 1;
                  }
                  $Array2D[$i][$j] = minimumThree(
                            $Array2D[$i - 1][$j] + 1,
                            $Array2D[$i][$j - 1] + 1,
                            $Array2D[$i - 1][$j - 1] + $value );
              }  
          }
    return $Array2D[@A1][@A2]; #RETURN THE VALUE OF EDIT DISTANCE
}


#IMPLEMENTING A FUNCTION TO FIND MINIMUM OF THE THREE ELEMENTS
sub minimumThree
{
#STORING THE ARGUEMENTS OF FUNCTION IN v1 v2 v3
my $v1 = $_[0];
my $v2 = $_[1];
my $v3 = $_[2];
if( $v1 <= $v2 )
{
  if( $v1 <= $v3 )
  {
    return $v1;  
    #FOR v1 TO BE MINIMUM IT HAS TO BE LESS THAN EQUAL TO V2 AND V3 BOTH
  }
}
if( $v2 <= $v3 )
{
  if( $v2 <= $v1 )
  {
     #FOR v2 TO BE MINIMUM IT HAS TO BE LESS THAN EQUAL TO V1 AND V3 BOTH
    return $v2;
  }
}
if( $v3 <= $v1 )
{
  if( $v3 <= $v2 )
  {
     #FOR v3 TO BE MINIMUM IT HAS TO BE LESS THAN EQUAL TO V2 AND V1 BOTH
    return $v3;
  }
}
}

