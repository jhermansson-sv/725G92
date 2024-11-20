-- jonhe899: Arbetat enskilt

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure Test_Exceptions is
   
   type Date_Type is
     array (1 .. 3) of Integer;
   
   type Date_Arr_Type is
     array(1 .. 5) of Date_Type;
   
   type Day_Amount is
     array (1 .. 12) of Integer;
   Date : constant Day_Amount := (31, 28, 31, 30, 31, 30, 31, 31, 
				  30, 31, 30, 31);
   
   
   Length_Error, Format_Error, Year_Error, Month_Error, Day_Error : exception;
   
   
   -- (DEL 1) Hämtar value och felhanterar efter min/max-värden
   procedure Get_Value_Safe (Min, Max : in Integer;
			     Value : out Integer) is
   begin
      
      loop
	 Put("Mata in värde (");
	 Put(Min, Width => 0);
	 Put(" - ");
	 Put(Max, Width => 0);
	 Put("): ");
	 
	 begin
	    Get(Value);
	    
	    if Value > Max then
	       Put("För stort värde. ");
	    elsif Value < Min then
	       Put("För litet värde. ");
	    elsif Value in Min..Max then
	       exit;
	    end if;
	    
	 exception when Data_Error => 
	    Skip_Line;
	    Put("Fel datatyp. ");
	 end;
      end loop;
   end Get_Value_Safe;
   
   
   -- (DEL 2 & 3) Läser in karaktär för karaktär och skapar en string
   procedure Get (Item : out String) is
      Read_In : Character;
   begin
      
      loop 
	 Get(Read_In);
	 
	 if Read_In /= ' ' then
	    Item(Item'First) := Read_In;
	    exit;
	 end if;
      end loop;
      
      for I in Item'First+1..Item'Last loop
	 if End_Of_Line then
	    raise Length_Error;
	 end if;
	 Get(Item(I));
	 
      end loop;
   end Get;
   
   
   -- (DEL 3) Matar ut datum
   procedure Put (Item : in Date_Type) is
   begin
      
      Put(Item(1), Width => 0);
      Put("-");
      
      for I in Item'First+1..Item'Last loop
	 if Item(I) < 10 then
	    Put("0");
	 end if;
	 Put(Item(I), Width => 0);
	 if I /= Item'Last then
	    Put("-");
	 end if;
      end loop;
   end Put;
   
   
   -- (DEL 3) Kontrollerar om inmatat år är ett skottår
   function Leap_Check (Year : in Integer) return Boolean is
   begin
      
      if (Year mod 4 = 0 and not (Year mod 100 = 0)) 
	or Year mod 400 = 0 then
	 return True;
      else
	 return False;
      end if;
   end Leap_Check;
   
   
   -- (DEL 3) Fastställer hur många dagar inmatad månad innehåller
   function Calc_Days (Month, Year : in Integer) return Integer is
   begin
      
      if Month = 2 and Leap_Check(Year) then
	 return 29;
      else
	 return Date(Month);
      end if;
   end Calc_Days;
     
   
   -- (DEL 3) Kontrollerar att inmatade värden är inom acceptabla spann
   procedure Acceptable_Values (Item : in Date_Type) is
   begin
	 
      if Item(1) > 9000 or Item(1) < 1532 then
	 raise Year_Error;
      end if;
      
      if Item(2) not in 1..12 then
	 raise Month_Error;
      end if;
      
      if Item(3) > Calc_Days(Item(2),Item(1)) or Item(3) < 1 then
	 raise Day_Error;
      end if;
      
   end Acceptable_Values;
   
   
   -- (DEL 3) Kontrollerar alla värden i strängen
   procedure String_Check (Date_String : in String) is
   begin
      
      loop 
	 if Date_String(5) /= '-' or Date_String(8) /= '-' then
	    raise Format_Error;
	 else exit;
	 end if;
      end loop;
   
      for I in 1..4 loop
      	 if Date_String(I) not in '0'..'9' then
      	    raise Format_Error;
      	 end if;
      end loop;
      
      for I in 6..7 loop
      	 if Date_String(I) not in '0'..'9' then
      	    raise Format_Error;
      	 end if;
      end loop;
      
      for I in 9..10 loop
      	 if Date_String(I) not in '0'..'9' then
      	    raise Format_Error;
      	 end if;
      end loop;
   end String_Check;
   
   
   -- (DEL 3) Hämtar string från första Get-programmet, kontrollerar att formatet är rätt och konverterar datumen till motsvarade integers
   procedure Get (Item : out Date_Type) is
      Date_String : String(1 .. 10);
   begin
      
      Get(Date_String);

      String_Check(Date_String);
      
      Item(1) := Integer'Value(Date_String(1 .. 4));
      Item(2) := Integer'Value(Date_String(6 .. 7));
      Item(3) := Integer'Value(Date_String(9 .. 10));
      
      Acceptable_Values(Item);
   end Get;
   
   
   --  Del 1, skriver ut ledtext och kallar på nödvändiga underprogram
   procedure Integer_Program is
      Min, Max, Value : Integer;
   begin
      
      Put_Line("Del 1:");
      Put("Mata in Min och Max: ");
      Get(Min);
      Get(Max);
      Get_Value_Safe(Min, Max, Value);
      Put("Du matade in heltalet ");
      Put(Value, Width => 0);
      Put('.');
      New_Line(2);
      Skip_Line;
   end Integer_Program;
   
   
   -- Del 2, skriver ut ledtext och kallar på nödvändiga underprogram
   procedure String_Program is
      S_1 : String(1 .. 5);
      S_2 : String(2 .. 7);
      S_3 : String(1 .. 10);
   begin
      
      Put_Line("Del 2:");
      Put("Mata in en sträng på exakt 5 tecken: ");
      Get(S_1);
      Put_Line("Du matade in " & S_1);
      Put("Mata in en sträng på exakt 6 tecken: ");
      Get(S_2);
      Put_Line("Du matade in " & S_2);
      Put("Mata in en sträng på exakt 10 tecken: ");
      Get(S_3);
      Put("Du matade in " & S_3);
      New_Line(2);
      Skip_Line;
   end String_Program;
   
   
   -- (DEL 3) Skriver ut datum i sin helhet
   procedure Put_Dates (Dates : in Date_Arr_Type) is
   begin
      
      for I in Dates'range loop
	 Put("Datum nummer ");
	 Put(I, Width => 0);
	 Put(": ");
	 Put(Dates(I));
	 New_Line;
      end loop;
   end;
   
   
   -- Del 3, skriver ut ledtexter, kallar på nödvändiga underprogram och felhanterar
   procedure Dates_Program is
      Dates : Date_Arr_Type;
   begin
      
      Put_Line("Del 3:");
      for I in Dates'range loop
	 loop
	    begin
	       Put("Mata in datum ");
	       Put(I, Width => 0);
	       Put(": ");
	       Get(Dates(I));
	       exit;
	       
	    exception
	       when Length_Error =>
		  Put("Felaktigt format! ");     
	       when Year_Error =>
		  Put("Felaktigt år! ");
	       when Month_Error =>
		  Put("Felaktig månad! ");
	       when Day_Error =>
		  Put("Felaktig dag! ");
	       when Format_Error => 
		  Put("Felaktigt format! ");
	       when Constraint_Error =>
		  Put("Felaktigt format! ");
	    end;
	 end loop;
      end loop;
      
      Put_Dates(Dates);
   end Dates_Program;
   
   
   --HUVUDPROGRAM--
begin
   
   Integer_Program;
   begin
      String_Program;
      Dates_Program;
      
   exception
      when Length_Error =>
	 Put("För få inmatade tecken!"); 
      when Format_Error =>
	 Put("Felaktigt format! ");
	 
   end;
end Test_Exceptions;
