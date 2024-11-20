with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure Testprogram is
   
   I : Integer;
   S : String(1..5);
   F : Float;
   C : Character;
   
begin
   
   Put("Skriv in ett heltal: ");
   Get(I);
   Put("Du skrev in talet: ");
   Put(I, Width => 2);
   Skip_Line;
   New_Line(2);


   Put("Skriv in fem heltal: ");
   Get(I);
   Put("Du skrev in talen: ");
   Put(I, Width => 0);
   Put(" ");
   Get(I);
   Put(I, Width => 0);
   Put(" ");
   Get(I);
   Put(I, Width => 0);
   Put(" ");
   Get(I);
   Put(I, Width => 0);
   Put(" ");
   Get(I);
   Put(I, Width => 0); 
   Skip_Line;
   New_Line(2);


   Put("Skriv in ett flyttal: ");
   Get(F);
   Put("Du skrev in flyttalet: ");
   Put(F, Fore => 1, Aft =>  3, Exp => 0); Skip_Line;
   New_Line(2);


   Put("Skriv in ett heltal och ett flyttal: ");
   Get(I);
   Get(F);
   Put("Du skrev in heltalet:");
   Put(I, Width => 10);
   New_Line;
   Put("Du skrev in flyttalet:");
   Put(F, Fore => 4, Aft => 4, Exp => 0); 
   Skip_Line;
   New_Line(2); 


   Put("Skriv in ett tecken: ");
   Get(C);
   Put("Du skrev in tecknet: ");
   Put(C); 
   Skip_Line;
   New_Line(2);


   Put("Skriv in en sträng med 5 tecken: ");
   Get(S(1..5));
   Put("Du skrev in strängen: ");
   Put(S(1..5)); 
   Skip_Line;
   New_Line(2);



   Put("Skriv in en sträng med 3 tecken: ");
   Get(S(1..3));
   Put("Du skrev in strängen: ");
   Put(S(1..3)); 
   Skip_Line;
   New_Line(2);


   Put("Skriv in ett heltal och en sträng med 5 tecken: ");
   Get(I);
   Get(C);
   Get(S(1..5));
   Put("Du skrev in talet |");
   Put(I, Width => 0);
   Put("| och strängen |");
   Put(S(1..5));
   Put("|."); 
   Skip_Line;
   New_Line(2);


   Put("Skriv in en sträng med 3 tecken och ett flyttal: ");
   Get(S(1..3));
   Get(F);
   Put("Du skrev in """);
   Put(F, Aft => 3, Exp =>  0);
   Put(""" och """);
   Put(S(1..3));
   Put("""."); 
   Skip_Line;
   New_Line(2);


   Put("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_Line(S, I);
   Put("Du skrev in strängen: ");
   
   if I < 5 then
      Put(S(1..I));
   else
      Put(S(1..5));
      Skip_Line;
   end if;
   New_Line(2);
   
   
   Put("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_Line(S, I);
   Put("Du skrev in strängen: ");
   
   if I <= 5 then
      Put(S(1..I));
   else
      Put(S(1..5));
   end if;
   
end Testprogram;
