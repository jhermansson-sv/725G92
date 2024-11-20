-- jonhe899: arbetat enskilt
with Ada.Text_IO;                     use Ada.Text_IO;
with Ada.Float_Text_IO;               use Ada.Float_Text_IO;


procedure Record_Program is
   
   
   --Skapande av datatyper
   type DS1_Type is
      record
	 W : Character;
	 P : String(1..4);
      end record;
   
   type DS2_sub is
      record
	 S : Float;
	 Z : String(1..4);
      end record;
   
   type DS2_Type is
      record 
	 D, U : DS2_Sub;
      end record;
   
   type DS3_Sub is
      record 
	 Y, Q: Character;
      end record;
   
   type DS3_Sub2 is
      record
	 T : Boolean;
	 L : Character;
      end record;
   
   type DS3_Type is
      record
	 J, B : DS3_Sub;
	 O    : DS3_Sub2;
      end record;
   
   
   
   --Get för DS1
   procedure Get1(DS1 : out DS1_Type) is
      Blank : Character;
   begin
      Get(DS1.W);
      Get(Blank);
      Get(DS1.P(1..4));
   end Get1;
   
   --Put för DS1
   procedure Put1(DS1 : in DS1_Type) is
   begin
      Put(DS1.W);
      Put(" ");
      Put(DS1.P(1..4));
   end Put1;
   
   
   
   --Get för DS2 samt DS2_sub
   procedure Get2(DS2 : out DS2_Type) is
      Blank : Character;
      procedure Get2_Sub(Value : out DS2_Sub) is
      begin
	 Get(Value.S);
	 Get(Blank);
	 Get(Value.Z);
      end Get2_Sub;
      
   begin
      Get2_sub(DS2.D);
      Get(Blank);
      Get2_sub(DS2.U);
   end Get2;
   
   --Put för DS2 samt DS2_sub
   procedure Put2(DS2 : in DS2_Type) is
      
      procedure Put2_Sub(Value : in DS2_Sub) is
      begin
	 Put(Value.S, Fore => 0, Aft => 3, Exp => 0);
	 Put(" ");
	 Put(Value.Z);
      end Put2_Sub;
      
   begin
      Put2_sub(DS2.D);
      Put(" ");
      Put2_sub(DS2.U);
   end Put2;
   
   
   
   --Get för DS3, DS3_sub samt DS3_sub2
   procedure Get3(DS3 : out DS3_Type) is
      Blank : Character;    
      procedure Get3_Sub(Value : out DS3_Sub) is
      begin
	 Get(Value.Y);
	 Get(Blank);
	 Get(Value.Q);
      end Get3_Sub;
      
      --Denna procedur hämtar och kontrollerar även inmatad character för att
      ---fastställa Boolean värde
      procedure Get3_sub2(Value : out DS3_sub2) is
	 Temp_Char_T : Character;
      begin
	 Get(Temp_Char_T);
	 Get(Blank);
	 Get(Value.L);
	 
	 if Temp_Char_T = 'T' then
	    Value.T := True;
	 else
	    Value.T := False;
	 end if;
      end Get3_sub2;
      
   begin
      Get3_Sub(DS3.J);
      Get(Blank);
      Get3_Sub(DS3.B);
      Get(Blank);
      Get3_Sub2(DS3.O);
   end Get3;
   
   --Put för DS3, DS3_sub samt DS3_sub2
   procedure Put3(DS3 : in DS3_Type) is
      
      procedure Put3_Sub(Value : in DS3_Sub) is
      begin
	 Put(Value.Y);
	 Put(" ");
	 Put(Value.Q);
      end Put3_Sub;
      
      procedure Put3_Sub2(Value : in DS3_Sub2) is
      begin
	 
	 if Value.T then
	    Put("True");
	 else
	    Put("False");
	 end if;
	 
	 Put(" ");
	 Put(Value.L);
      end Put3_Sub2;
      
   begin
      Put3_sub(DS3.J);
      Put(" ");
      Put3_sub(DS3.B);
      Put(" ");
      Put3_Sub2(DS3.O);
   end Put3;
   
   
   
   
   DS1 : DS1_Type;
   DS2 : DS2_Type;
   DS3 : DS3_Type;
   
begin
   --Inmatning DS1
   Put_Line("För DS1:");
   Put("Mata in datamängd: ");
   Get1(DS1);
   Put("Inmatad datamängd: ");
   Put1(DS1);
   New_Line(2);
   
   --Inmatning DS2
   Put_Line("För DS2:");
   Put("Mata in datamängd: ");
   Get2(DS2);
   Put("Inmatad datamängd: ");
   Put2(DS2);
   New_Line(2);
   
   --Inmatning DS3
   Put_Line("För DS3:");
   Put("Mata in datamängd: ");
   Get3(DS3);
   Put("Inmatad datamängd: ");
   Put3(DS3);
   
end Record_Program;
