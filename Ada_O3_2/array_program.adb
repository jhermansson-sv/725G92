--Jonhe899: Arbetat enskilt
with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;



procedure Array_Program is
   
   type Float_Array is
     array (31 .. 35) of Float;
   
   type String_Array is
     array (Character range '5'  ..  '9') of String(1..5);
   
   type Boolean_Array is
     array (False .. True) of String_Array;
   
   type Integer_Array is
     array (73..74, Character range '4' .. '8') of Integer;
   
   
   
   --Get för DS1--
   procedure Get1(DS1 : out Float_Array) is
   begin
      for I in reverse Float_Array'Range loop
	 Get(DS1(I));
      end loop;
   end Get1;
   
   --Put för DS1--
   procedure Put1(DS1 : in Float_Array) is
   begin
      for I in reverse Float_Array'Range loop
	 Put(" ");
	 Put(DS1(I), Fore => 0, Aft => 3, Exp => 0);
      end loop;
   end Put1;
   
   
   
   --Get för DS2--
   procedure Get2_Sub(Value : out String_Array) is
      
      C : Character;
   begin
      for I in reverse String_Array'Range loop
	 
	 if not (I = Value'Last) then
	    Get(C);
	 end if;
	 
	 Get(Value(I));
	 
      end loop;
   end Get2_Sub;
   
   procedure Get2(DS2 : out Boolean_Array) is
      
      C : Character;
   begin
      for B in Boolean_Array'Range loop  
         Get2_Sub(DS2(B));
	 
	 if not (B = DS2'Last) then
	    Get(C);
	 end if;
	 
      end loop;
   end Get2;
   
   --Put för DS2--
   procedure Put2_Sub(Value : in String_Array) is
      
   begin
      for I in reverse String_Array'Range loop
	 Put(" ");
	 Put(Value(I));
      end loop;
   end Put2_Sub;
   
   procedure Put2(DS2 : in Boolean_Array) is
      
   begin
      for B in Boolean_Array'Range loop
	 Put2_Sub(DS2(B));
      end loop;
   end Put2;
   
   
   
   --Get för DS3--
   procedure Get3(DS3 : out Integer_Array) is
      
   begin
      for I in Integer_Array'Range(1) loop
	 for Pos in Integer_Array'Range(2) loop
	 Get(DS3(I,Pos));
	 end loop;
      end loop;
   end Get3;
   
   --Put för DS3--
   procedure Put3(DS3 : in Integer_Array) is
      
   begin
      for I in Integer_Array'Range(1) loop
	 for Pos in Integer_Array'Range(2) loop
	    Put(" ");
	    Put(DS3(I,Pos), Width => 0);
	 end loop;
      end loop;
   end Put3;
   
     
   --Huvudprogram--
   
   DS1 : Float_Array;
   DS2 : Boolean_Array;
   DS3 : Integer_Array;
   
begin
   --In- och utmatning DS1
   Put_Line("För DS1:");
   Put("Mata in datamängd: ");
   Get1(DS1);
   Put("Inmatad datamängd:");
   Put1(DS1);
   New_Line(2);
   
   --In- och utmatning DS2
   Put_Line("För DS2:");
   Put("Mata in datamängd: ");
   Get2(DS2);
   Put("Inmatad datamängd:");
   Put2(DS2);
   New_Line(2);
   
   --In- och utmatning DS3
   Put_Line("För DS3:");
   Put("Mata in datamängd: ");
   Get3(DS3);
   Put("Inmatad datamängd:");
   Put3(DS3);
end Array_Program;
