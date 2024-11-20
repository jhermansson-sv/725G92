-- jonhe899: arbetat enskilt

with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

package body Sorted_List is
   
   --
   function Empty (List : in List_Type) return Boolean is
   begin
      if List = null then
	 return True;
      else 
	 return False;
      end if;
   end Empty;
      
   --
   function Length (List : in List_Type) return Integer is
   begin
      if Empty(List) then
	 return 0;
      else
	 return 1 + Length(List.Next);
      end if;
   end Length;
   
   ---
   function Member (List : in List_Type;
		    Key : in Integer) return Boolean is
   begin
      if Empty(List) then
	 return False;
      end if;
      
      if List.Data = Key then
	 return True;
      else
	 return Member(List.Next, Key);
      end if;
   end Member;
   
   --
   procedure Free is
      new Ada.Unchecked_Deallocation(E_Type, List_Type);
   
   --
   procedure Remove (List : in out List_Type;
		     Value : in Integer) is
      Tmp : List_Type;
   begin
      
      if List /= null then
	 
	 if Value = List.Data then
	    Tmp := List.Next;
	    List.Next := null;
	    Free(List);
	    List := Tmp;
	 else
	    Remove(List.Next, Value);
	 end if;
	 
      else
	 raise No_Such_Element_Error;
      end if;
   end Remove;
   
   --
   procedure Delete (List : in out List_Type) is
   begin
      if List /= null then
	 Delete(List.next);
	 Free(List);
	 List := null;
      end if;
   end Delete;
   
   --
   procedure Insert (List : in out List_Type;
		     Value : in Integer) is
      Tmp : List_Type;
   begin
      
      if List = null then
	 List := new E_Type'(Value, null);
      else
	 
	 if Value /= List.Data then
	    
	    if Value > List.Data then
	       
	       Insert(List.Next, Value);
	    else
	       Tmp := new E_Type;
	       Tmp.Data := Value;
	       Tmp.Next := List;
	       List := Tmp;
	    end if;
	 end if;
      end if;

   end Insert;
   
   --
   procedure Put (List : in List_Type) is
   begin
      if Empty(List) then
	 null;
      else
	 Put(' ');
	 Put(List.Data, Width => 0);
	 Put(List.Next);
      end if;
   end Put;
   
   
end Sorted_List;
