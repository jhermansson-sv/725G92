with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;


procedure Momstabell is
   
   FP, SP, ST, MP, PM, M, Varv_Konv : Float;
   Varv : Integer;

begin
   
   loop
      Put("Första pris: ");
      Get(FP);
      exit when FP >= 0.0;
      Put_Line("Felaktigt värde!");
   end loop;

   loop
      Put("Sista pris: ");
      Get(SP);
      exit when SP >= FP;
      Put_Line("Felaktigt värde!");
   end loop;

   loop
      Put("Steg: ");
      Get(ST);
      exit when ST > 0.0;
      Put_Line("Felaktigt värde!");
   end loop;
   
   loop
      Put("Momsprocent: ");
      Get(MP);
      exit when MP >= 0.0 and MP <= 100.00;
      Put_Line("Felaktigt värde!");
   end loop;
   
   New_Line;
   
   M := (FP * MP)/100.0;
   PM := (FP + M);
   Varv_Konv := (SP-FP)/(ST);
   Varv := Integer(Float'Floor(Varv_Konv));
   
   Put_Line("============ Momstabell ============"); 
   Put("Pris utan moms  Moms   Pris med moms"); 

   for I in 0..Varv loop
      New_Line;
      Put(FP, Fore => 6, Aft => 2, Exp => 0);
      Put(M, Fore => 8, Aft => 2, Exp => 0);
      Put(PM, Fore => 9, Aft => 2, Exp => 0);
      
      FP := (FP + ST);
      M := (FP * MP)/100.0;
      PM := (FP + M);
   end loop;
   
end Momstabell;
