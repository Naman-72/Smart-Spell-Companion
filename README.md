ASSIGNMENT 3
Name       : Naman Anand
Roll no    : 200101070
SUBJECT    : CS242
ASSIGNMENT : 3
IIT GUWAHATI 2020-24



*******************************************************************************************************************************************************************************
RUNNING command ->
perl 200101070_Assign3.pl

I have considered Dictionary of linux command as Sir told
I have taken assumption that user Enter Correctly the index as Suggestion Correctly Otherwise it will not work properly
Approach Using Levenstein distance 
First Checking in a Dictionary 
if present then I am not changing
Otherwise finding The Nearly Nearest word to it 
and asking user
For Other Details about Program Please see My comments My code is well commented Explaining Mostly every line
Also I am providing equal spaced words if the user by mistakes put more than 1 space 
Like my program Work like this ->

*****************************************************************************************************************************************************************************

naman@naman-VirtualBox:~/Desktop$ perl 200101070_Assign3.pl 
Please Enter Your Input : 
naman is ok co man chmod ls 

naman^: Please Check This Word Again.
Do You Want Suggestion ? Press Y / y to view Suggestions else Press any other Key to Continue : N
Ignoring the Spelling Mistake . Assuming You Have Entered Correctly


is^: Please Check This Word Again.
Do You Want Suggestion ? Press Y / y to view Suggestions else Press any other Key to Continue : y
Suggestions are -> 0) ls 
To Replace / Substitute the Word 
Press The Index Shown in Suggestion To Replace the word by that Word : 0
REPLACED SUCCESSFULLY

ok^: Please Check This Word Again.
Do You Want Suggestion ? Press Y / y to view Suggestions else Press any other Key to Continue : Y
Suggestions are -> 0) ul 1) bc 2) cp 3) dc 4) tr 5) vi 6) mv 7) w 8) wc 9) top 10) look 11) cd 12) rm 13) ln 14) ar 15) dd 16) awk 17) ls 18) xz 19) cc 
To Replace / Substitute the Word 
Press The Index Shown in Suggestion To Replace the word by that Word : 10
REPLACED SUCCESSFULLY

co^: Please Check This Word Again.
Do You Want Suggestion ? Press Y / y to view Suggestions else Press any other Key to Continue : y
Suggestions are -> 0) cp 1) cd 2) cc 
To Replace / Substitute the Word 
Press The Index Shown in Suggestion To Replace the word by that Word : 0
REPLACED SUCCESSFULLY

HENCE YOUR MODIFIED/UNMODIFIED INPUT WITH EQUAL SPACES IS : 
naman ls look cp man chmod ls 
*****************************************************************************************************************************************************************************

Thank You For Visiting My Code
