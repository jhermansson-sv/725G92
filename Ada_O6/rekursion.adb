-- jonhe899: Arbetat enskilt

with Ada.Integer_Text_IO;        use Ada.Integer_Text_IO;
with Ada.Text_IO;                use Ada.Text_IO;

procedure Rekursion is
   
   
   -- Del 1 Returnerar det N:te fibonacci-talet
   function Fib (N : in Integer) return Integer is
   begin
      if N = 1 or N = 2 then
	 return 1;
      else
	 return (Fib(N-1)+Fib(N-2)); 
      end if;
   end Fib;
   
   
   -- Del 2 Kalkylerar och returnerar antalet stenar som krävs
   function House_Calc (HH : in Integer) return Integer is
   begin
      if HH = 1 then
	 return 0;
      else
	 return ((HH-1)*(2*(HH)-3)+House_Calc(HH-1));
      end if;
   end House_Calc;
   
   
   -- Deklarationer
     N, HH : Integer;
   
   
   -- Del 3 Huvudprogram
begin
   
   Put("Mata in N och HH: ");
   Get(N);
   Get(HH);
   Put("Fibonacci-tal nummer ");
   Put(N, Width => 0);
   Put(" är ");
   Put(Fib(N), Width => 0);
   Put(".");
   New_Line;
   Put("Det behövs ");
   Put(House_Calc(HH), Width => 0);
   Put(" stenar för att bygga trappan.");
   
end Rekursion;
