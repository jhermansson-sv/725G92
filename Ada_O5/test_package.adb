-- jonhe899: Arbetat enskilt

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Test_Package is
   
   
   type Day_Amount is
     array (1 .. 12) of Integer;
   Date : constant Day_Amount := (31, 28, 31, 30, 31, 30, 31, 31, 
				  30, 31, 30, 31);
   
   Length_Error : exception;
   
   
   -- Läser in karaktär för karaktär och skapar en string
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
   
   
   procedure Put_Sub_Ten (Item : in Integer) is
   begin
      if Item < 10 then
	 Put("0");
	 Put(Item, Width => 0);
      else
	 Put(Item, Width => 0);
      end if;
   end Put_Sub_Ten;
   
   
   -- Matar ut datum
   procedure Put (Item : in Date_Type) is
   begin
      
      Put(Item.Year, Width => 0);
      Put("-");
      
      Put_Sub_Ten(Item.Month);
      Put("-");
      Put_Sub_Ten(Item.Day);
			  
   end Put;
   
   
   -- Kontrollerar om inmatat år är ett skottår
   function Leap_Check (Year : in Integer) return Boolean is
   begin
      
      if (Year mod 4 = 0 and not (Year mod 100 = 0)) 
	or Year mod 400 = 0 then
	 return True;
      else
	 return False;
      end if;
   end Leap_Check;
   
   
   -- Fastställer hur många dagar inmatad månad består av, med hänsyn till skottår
   function Calc_Days (Month, Year : in Integer) return Integer is
   begin
      
      if Month = 2 and Leap_Check(Year) then
	 return 29;
      else
	 return Date(Month);
      end if;
   end Calc_Days;
     
   
   -- Kontrollerar att inmatade värden är inom acceptabla spann
   procedure Acceptable_Values (Item : in Date_Type) is
   begin
	 
      if Item.Year > 9000 or Item.Year < 1532 then
	 raise Year_Error;
      end if;
      
      if Item.Month not in 1..12 then
	 raise Month_Error;
      end if;
      
      if Item.Day > Calc_Days(Item.Month ,Item.Year) or Item.Day < 1 then
	 raise Day_Error;
      end if;
   end Acceptable_Values;
   
   
   -- Kontrollerar alla värden i strängen
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
   
   
   -- funktion som returnerar datumet efter det inmatade datumet
   function Next_Date (Original : in Date_Type) return Date_Type is
      Temp : Date_Type;
   begin
      
      if (Original.Day+1) > Calc_Days(Original.Month, Original.Year) then
	 Temp.Day := 1;
	 Temp.Month := (Original.Month+1);
      else
	 Temp.Month := Original.Month;
	 Temp.Day := (Original.Day+1);
      end if;
      
      if Temp.Month > 12 then
	 Temp.Month := 1;
	 Temp.Year := (Original.Year+1);
      else
	 Temp.Year := Original.Year;
      end if;
	 
      return Temp;
   end Next_Date;
  
   
   -- funktion som returnerar det värde som kommer före det inmatade värdet
   function Previous_Date (Original : in Date_Type) return Date_Type is
      Temp : Date_Type;
   begin
      
      if (Original.Day-1) < 1 then
	 Temp.Month := (Original.Month-1);
	 
	 if Temp.Month < 1 then
	    Temp.Month := 12;
	    Temp.Year := (Original.Year-1);
	 else
	    Temp.Year := Original.Year;
	 end if;
	 
	 Temp.Day := Calc_Days(Temp.Month, Original.Year);
      else
	 Temp.Month := Original.Month;
	 Temp.Day := (Original.Day-1);
	 Temp.Year := Original.Year;
      end if;
      
      return Temp;
   end Previous_Date;
   
   
   -- operator som baserat på inmatade datum returnerar true om datum 2 kommer senare än datum 1
   function "<" (F_Date, S_Date : in Date_Type) return Boolean is
   begin
      
      if F_Date.Year < S_Date.Year then
	 return True;
      elsif F_Date.Year = S_Date.Year then
	 
	 if F_Date.Month < S_Date.Month then
	    return True;
	 elsif F_Date.Month = S_Date.Month then
	    
	    if F_Date.Day < S_Date.Day then
	       return True;
	    end if;
	    
	 end if;
      end if;
      return False;
   end "<";
   
      
   -- operator som baserat på inmatade datum returnerar true om datum 1 kommer senare än datum 2
   function ">" (F_Date, S_Date : in Date_Type) return Boolean is
   begin
      
      if S_Date < F_Date then
	 return True; 
      else
	 return False;
      end if;
   end ">";
   
   
   -- operator som baserat på inmatade datum returnerar true om datum 1 är lika med datum 2
   function "=" (F_Date, S_Date : in Date_Type) return Boolean is
   begin
      
      if F_Date > S_Date or F_Date < S_Date then
	 return False;
      else
	 return True;
      end if;      
   end "=";
   
         
   -- Hämtar string från första Get-programmet, kontrollerar att formatet är rätt och konverterar datumen till motsvarande integers
   procedure Get (Item : out Date_Type) is
      Date_String : String(1 .. 10);
   begin
      
      Get(Date_String);

      String_Check(Date_String);
      
      Item.Year := Integer'Value(Date_String(1 .. 4));
      Item.Month := Integer'Value(Date_String(6 .. 7));
      Item.Day := Integer'Value(Date_String(9 .. 10));
      
      Acceptable_Values(Item);
   end Get;

end Test_Package;
