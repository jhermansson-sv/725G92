with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Numerics;                      use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;


procedure Kalkylator is
   
   
   -- program för att beräkna hypotenusan
   function Calc_Hypothenuse(A, B : in Integer) return Float is
   begin
      return Sqrt(Float((A**2)+(B**2)));
   end Calc_Hypothenuse;
   
   
   -- program för in och utmatning av data kopplat till hypotenusan
   procedure Hypothenuse_Program is
      A, B : Integer;
   begin	  
      Put("Mata in kateternas längder: ");
      Get(A);
      Get(B);
      Put("Hypotenusan är ");
      Put(Calc_Hypothenuse(A, B), Fore => 0, Aft => 2, Exp => 0);
      New_Line(2);
   end Hypothenuse_Program;
   
   
   -- program för att beräkna vinklar
   procedure Calc_Angles(Hc, Sa     : in Float;
			 Va, Vb, Vc : out Float) is
      Radical : Float;
   begin
      Radical := Arcsin(Sa/Hc);
      Va := ((Radical/Pi)*180.0);
      Vc := 90.0;
      Vb := 180.0 - Va - Vc;
   end Calc_Angles;
   
   
   -- program för att hämta och mata ut data kopplat till vinklarna
   procedure Angle_Program is
      Va, Vb, Vc, Hc, Sa : Float;
   begin
      Put("Mata in hypotenusans längd: ");
      Get(Hc);
      Put("Mata in vertikala katetens längd: ");
      Get(Sa);
      Calc_Angles(Hc, Sa, 
		  Va, Vb, Vc);
      Put("Va: ");
      Put(Va, Fore => 0, Aft => 1, Exp => 0);
      Put_Line(" grader");
      Put("Vb: ");
      Put(Vb, Fore => 0, Aft => 1, Exp => 0);
      Put_Line(" grader");
      Put("Vc: ");
      Put(Vc, Fore => 0, Aft => 1, Exp=> 0);
      Put_Line(" grader");
      New_Line;
   end Angle_Program;
   
   
   -- program för att beräkna n-fakultet
   function Calc_Factorial(N : in Integer) return Integer is
      NF : Integer := 1;
   begin
      for Varv in 1..N loop
	 NF := (NF*(Varv));
      end loop;
      return NF;
   end Calc_Factorial;
   
   
   -- program för in och utmatning av data kopplat till n-fakultet
   procedure Factorial_Program is
      N, NF : Integer;
   begin
      Put("Mata in N: ");
      Get(N);
      NF := Calc_Factorial(N);
      Put(N, Width => 0);
      Put("-fakultet = ");
      Put(NF, Width => 0);
      New_Line(2);
   end Factorial_Program;
   
   
   -- program för menyval
   procedure Menu_Selection(Input : out Integer)  is
   begin
      loop
	 Put_Line("=== HUVUDMENY ===");
	 Put_Line("1. Beräkna hypotenusa");
	 Put_Line("2. Beräkna triangelvinklar");
	 Put_Line("3. Beräkna N-fakultet");
	 Put_Line("4. Avsluta programmet");
	 
	 loop
	    Put("Val: ");
	    Get(Input);
	    exit when Input >= 1 and Input <= 4;
	    Put_Line("Felaktigt val!");
	 end loop;
	 
	 exit when Input >= 1 and Input <= 4;
      end loop;
   end Menu_Selection;
   
   
   
   Input : Integer;
   
   
   -- start huvudprogram
begin
   
   Put_Line("Välkommen till miniräknaren!");
   loop
      
      Menu_Selection(Input);
      
      if Input = 1 then
	 Hypothenuse_Program;
      elsif 
	Input = 2 then
	 Angle_Program;
      elsif 
        Input = 3 then
	 Factorial_Program;
      elsif 
	Input = 4 then
	 Put("Ha en bra dag!");
	 exit;
      end if;
      
   end loop;
end Kalkylator;

