# Spell Checker Program
<H3>Course Project<H3>
<H6>
  Name       : Naman Anand
<br>
  Roll no    : 200101070
<br>
  SUBJECT    : CS242
<br>
  ASSIGNMENT : 3 (3RD SEMESTER)
<br>
  IIT GUWAHATI 2020-24
  </H6>

<img width="620" alt="image" src="https://user-images.githubusercontent.com/77402137/179352818-9fbd3964-134e-48bf-853c-d2ab0c31e1e6.png">
<hr>
  
  <H1> How To Run 💻 </H1>
perl 200101070_Assign3.pl

  <H4>Some Insights Of Project</H4>
  <ul>
    <li>
      I have considered Dictionary of linux command aas per mentioned in our course project.
      <br>
      But You Can change Dictionary According To You.
    </li>
    <li>
      <span>Approach Using <strong>Levenstein distance</strong> <span>
      <br>
      First Checking in a Dictionary , if present then It will accept it as word and move to next word Otherwise it will find the Nearest word to it 
      and asks user which word he/she wants or simply ignore the suggestions 
    </li>
  </ul>

*****************************************************************************************************************************************************************************
     EX: 
<img width="927" alt="image" src="https://user-images.githubusercontent.com/77402137/179353224-f0bcc20a-1fe2-4a8f-ac0c-2fedf0f9f10a.png">

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

Thank You For Visiting 
