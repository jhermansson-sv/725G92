-- jonhe899: arbetat enskilt

with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Command_Line;       use Ada.Command_Line;

procedure Vikingska_Tal is
   
   
   Argument_Count_Error : exception;
   
   type Allowed_Characters is
     array (Character range 'a'..'g') of Character;
   
   type Viking_Arr is
     array (1..7) of Integer;
   Viking : constant Viking_Arr := (1, 7, 12, 42, 112, 365, 1024);
   
   
      -- kontrollerar om de inlästa bokstäverna är korrekta vikingtal
   function Is_Allowed (String_In : in String;
			L         : in Integer) return Boolean is
   begin
      for I in 1..L loop
	 if String_In(I) not in Allowed_Characters'range then
	    return False;
	 end if;
      end loop;
      return True;
   end Is_Allowed;
   
   -- returnerar siffervärdet av det inmatade vikingtalet
   function Val_Conversion (Ch_Str : in String;
			    L      : in Integer) return Integer is
      Val : Integer := 0;
   begin
      for I in 1..L loop
	 case Ch_Str(I) is
	    when 'a' => Val := Val+Viking(1);
	    when 'b' => Val := Val+Viking(2);
	    when 'c' => Val := Val+Viking(3);
	    when 'd' => Val := Val+Viking(4);
	    when 'e' => Val := Val+Viking(5);
	    when 'f' => Val := Val+Viking(6);
	    when 'g' => Val := Val+Viking(7);
	    when others => null;
	 end case;
      end loop;
      return Val;
   end Val_Conversion;
   
   -- returnerar ett sorterat vikingtal
   function Sorted_Viking (Unsorted_Str : in String;
			   L            : in Integer) return String is
      Adjusted_Val : Integer;
      Sorted_Str : String(1..31);
   begin
      Adjusted_Val := Val_Conversion(Unsorted_Str, L);
      for I in 1..31 loop
	 if Adjusted_Val = 0 then
	    Sorted_Str(I) := ' ';
	 elsif Adjusted_Val / Viking(7) >= 1 then
	    Sorted_Str(I) := 'g';
	    Adjusted_Val := (Adjusted_Val - Viking(7));
	 elsif Adjusted_Val / Viking(6) >= 1 then
	    Sorted_Str(I) := 'f';
	    Adjusted_Val := (Adjusted_Val - Viking(6));
	 elsif Adjusted_Val / Viking(5) >= 1 then
	    Sorted_Str(I) := 'e';
	    Adjusted_Val := (Adjusted_Val - Viking(5));
	 elsif Adjusted_Val / Viking(4) >= 1 then
	    Sorted_Str(I) := 'd';
	    Adjusted_Val := (Adjusted_Val - Viking(4));
	 elsif Adjusted_Val / Viking(3) >= 1 then
	    Sorted_Str(I) := 'c';
	    Adjusted_Val := (Adjusted_Val - Viking(3));
	 elsif Adjusted_Val / Viking(2) >= 1 then
	    Sorted_Str(I) := 'b';
	    Adjusted_Val := (Adjusted_Val - Viking(2));
	 elsif Adjusted_Val / Viking(1) >= 1 then
	    Sorted_Str(I) := 'a';
	    Adjusted_Val := (Adjusted_Val - Viking(1));
	 end if;
      end loop;
      return Sorted_Str;
   end Sorted_Viking;
   
   -- skriver den nya filen
   procedure Write_File (Output                    : in     File_Type;
			 Allowed_Str               : in     String;
			 L                         : in     Integer;
			 Comparison_String         : in out String;
			 Counter, Comparison_Value : in out Integer) is
   begin
      if L > 0 then
	 Counter := Counter+1;
	 
	 Put(Output, '|');
	 Put(Output, Allowed_Str(1..L));
	 
	 for I in 1..20-L loop
	    Put(Output, ' ');
	 end loop;
	 
	 Put(Output, '|');
	 if (Sorted_Viking(Allowed_Str, L)(1..L)) /= Allowed_Str(1..L) then
	    Put(Output, Sorted_Viking(Allowed_Str, L));
	 else
	    Put(Output, "                               ");
	 end if;
	 
	 Put(Output, '|');
	 if Val_Conversion(Sorted_Viking(Allowed_Str, L), L) > Val_Conversion(Comparison_String, L) then
	    Comparison_String := Sorted_Viking(Allowed_Str, L);
	 end if;
	 
	 Put(Output, Val_Conversion(Allowed_Str, L), Width => 10);
	 Put(Output, '|');
	 if Val_Conversion(Allowed_Str, L) > Comparison_Value then
	    Comparison_Value := Val_Conversion(Allowed_Str, L);
	 end if;
	 New_Line(Output);
      end if;
   end Write_File;
   
   --
   function Layout (Style : in Integer) return String is
   begin
      if Style = 1 then
	 return "|Inläst sträng       |Korrigerat vikingskt tal       |Värde     |";
      end if;
      return "=================================================================";
   end;
   
   -- läser in filen och skickar vidare tillåtna tal till write_file som skriver den nya filen
   procedure Read_File (Input, Output     : in     File_Type;
			Comparison_String : in out String;
			Comparison_Value  : in out Integer) is
      Input_Data : String(1..20);
      I, Counter : Integer;
   begin  
      
      Put_Line(Output, Layout(1));
      Put_Line(Output, Layout(2));
      
      Counter := 0;
      while not End_Of_File(Input) loop
	 Get_Line(Input, Input_Data, I);
	 
	 if Is_Allowed(Input_Data, I) then
	    Write_File(Output, Input_Data, I, Comparison_String,
		       Counter, Comparison_Value);
	 end if;
      end loop;
      
      Put(Output, Layout(2));
   end Read_File;
   
   -- skriver ut de största värdena i terminalen som heltal och vikingtal
   procedure Print_To_Terminal (Comparison_String : in String;
				Comparison_Value  : in Integer) is
   begin
      Put("Största som heltal: ");
      Put(Comparison_Value, Width => 0);
      New_Line;
      
      Put("Största som vikingskt tal: ");
      for I in Comparison_String'First..Comparison_String'Last-1 loop
	 if Comparison_String(I) /= ' ' then
	    Put(Comparison_String(I));
	 end if;
      end loop;
   end Print_To_Terminal;
   
   Input, Output : File_Type;
   Comparison_String : String(1..31);
   Comparison_Value : Integer := 0;
   
begin

   if (Argument_Count) = 1 Then
      Open(Input, In_File, Argument(1));
      
      Create(Output, Out_File, "CORRECTED_VIKING_NUMBERS.TXT");
      
      Read_File(Input, Output, Comparison_String, Comparison_Value);
      
      Print_To_Terminal(Comparison_String, Comparison_Value);
      
      Close(Input);
      Close(Output);
   else
      Put_Line("felaktigt antal argument!");
      Put("Användning: ");
      Put(Command_Name);
      Put(" FILNAMN.TXT");
   end if;
   
end Vikingska_Tal;

