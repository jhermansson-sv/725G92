with Ada.Text_IO;                    use Ada.Text_IO;
with Ada.Float_Text_IO;              use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;            use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Float_Random;


procedure Slump_Program is
   
   
   subtype Integer_Intervall is
     Integer range 1..6;
   
   package Slumppaket_Integer is 
      new Ada.Numerics.Discrete_Random(Integer_Intervall);
      
   use Slumppaket_Integer;
   
   
   
   -- procedur för att slumpa tal
   procedure Slumpa(Input : in Integer;
		    G     : in Generator) is
      Lagrad : Integer;
   begin
      Reset(G);
      
      Lagrad := Input;
      Put(Input, Width => 0);
      
      if Lagrad > 1 then
	 Put(" slumpade");
      else 
	 Put(" slumpat");
      end if;
      Put(" heltal: ");
      
      for I in 1..Input loop
	 Put(Random(G), Width => 0);
	 Put(" ");
      end loop;
      
   end Slumpa;
         
      
   Input : Integer;
   G1 : Generator;
    
begin
   Put("Mata in antalet heltal som ska slumpas: ");
   Get(Input); 
   Slumpa(Input, G);
   
   
   
end Slump_Program;

