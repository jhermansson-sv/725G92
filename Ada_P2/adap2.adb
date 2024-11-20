with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;

procedure Adap2 is
   
   
   -- underprogram för att dividera integer med bestämd float
   function Dividera (Integer_Data : in Integer) return Float is
   begin
      return Float(Integer_Data)/(32.7); 
   end Dividera;
   
   
   -- underprogram för att addera tecken och integer
   function "+" (C_Data       : in Character;
		 Integer_Data : in Integer) return Float is
   begin
      return Float(Character'Pos(C_Data)-Character'Pos('0')+(Integer_Data));
   end "+";
   
   
   -- underprogram för att dividera heltal
   procedure Dividera_Heltal (Integer_Data, Integer_Data_2 : out Integer;
			      Result                       : out Float) is
   begin
      Put("Mata in ett heltal: ");
      Get(Integer_Data);
      Put("Mata in ett heltal: ");
      Get(Integer_Data_2);
      
      Result := Float'Rounding(Float(Integer_Data)/Float(Integer_Data_2));
   end Dividera_Heltal;
   
      
   Integer_Data, Integer_Data_2 : Integer;
   C_Data                       : Character;
   Result                       : Float;
   
   -- huvudprogram
begin
   Put("Mata in ett heltal: ");
   Get(Integer_Data);
   Put("kvoten mellan ");
   Put(Integer_Data, Width => 0);
   Put(" och 32.7 blir ");
   Put(Dividera(Integer_Data), Fore => 0, Aft => 1, Exp => 0);
   New_Line(2);
   
   Put("Mata in ett tecken: ");
   Get(C_Data);
   Put("Mata in ett heltal: ");
   Get(Integer_Data);
   Put("Den beräknade summan av ");
   Put(C_Data);
   Put(" och ");
   Put(Integer_Data, Width => 0);
   Put(" blir ");
   Put((C_Data+Integer_Data), Fore => 0, Aft => 1, Exp => 0);
   New_Line(2);
   
   Dividera_Heltal(Integer_Data, Integer_Data_2, Result);
   Put("Du matade in heltalet: ");
   Put(Integer_Data, Width => 0);
   Put(" och heltalet: ");
   Put(Integer_Data_2, Width => 0);
   Put(" och kvoten blev ");
   Put(Result);
   
end AdaP2;

