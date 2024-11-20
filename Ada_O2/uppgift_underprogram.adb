-- jonhe899: arbetat enskilt
with Ada.Text_IO;                             use Ada.Text_IO;
with Ada.Float_Text_IO;                       use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;                     use Ada.Integer_Text_IO;


procedure Uppgift_Underprogram is
   
   
   --operator för att subtrahera flyttal från heltal
   function "-"(A : in Integer;
		B : in Float) return Float is
   begin
      return (Float(A) - B);
   end "-";
   
   
   --underprogram för att kontrollera sista bokstaven i inmatad string
   procedure Check_Noun(Noun          : in out String;
			Verified_Noun : out Boolean) is
   begin
      if Noun(Noun'Last) = 's' then
	 Verified_Noun := True;
      else
	 Verified_Noun := False;
	 Noun(Noun'Last) := 's';
      end if;
   end Check_Noun;
   
   
   --underprogram för att kontrollera om inmatat tecken är "sant" eller "falskt"
   function Check_Character(Verify : in Character) return Boolean is
      
      Result : Boolean;
      
   begin
      if Verify = 's' or Verify = 'S' then
	 Result := True;
      else
	 Result := False;
      end if;
      return Result;
   end Check_Character;
   
   
   --deklarationer för huvudprogram
   A             : Integer;
   B             : Float;
   Verify        : Character;
   Verified_Noun : Boolean;
   Noun          : String(1..5);
   
   
   --start huvudprogram
begin
   Put("Mata in ett heltal och ett flyttal: ");
   Get(A);
   Get(B);
   Put("Differensen mellan dem är ");
   Put((A - B), Fore => 0, Aft => 2, Exp => 0);
   New_Line(2);
   
   
   Put("Skriv in ett 5 tecken långt engelskt substantiv: ");
   Get(Noun(1..5));
   Check_Noun(Noun, Verified_Noun);
   
   Put("Ordet ");
   Put(Noun);
   Put(" var troligtvis");
   if Verified_Noun = False then
      Put(" inte");
   end if;
   Put_Line(" i plural från början");
   New_Line;
   
   
   Put("Mata in ett tecken: ");
   Get(Verify);
   Put("Tecknet var ");
   if Check_Character(Verify) = False then
      Put("inte ");
   end if;
   Put("sant");
end Uppgift_Underprogram;
