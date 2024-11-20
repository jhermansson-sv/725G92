-- jonhe899: Arbetat enskilt
package Test_Package is
   
      
   type Date_Type is private;
   
   
   procedure Put (Item : in Date_Type);
      
   procedure Get (Item : out Date_Type);
   
   function Next_Date (Original : in Date_Type) return Date_Type;
   
   function Previous_Date (Original : in Date_Type) return Date_Type;
   
   function ">" (F_Date, S_Date : in Date_Type) return Boolean;
   
   function "<" (F_Date, S_Date : in Date_Type) return Boolean;
   
   function "=" (F_Date, S_Date : in Date_Type) return Boolean;
   
   Format_Error, Year_Error, Month_Error, Day_Error : exception;
   
   
private
   
   type Date_Type is
      record
	 Day, Month, Year : Integer;
      end record;

   
end Test_Package;
