-----------------------------------------------------------------------
--          GtkAda - Ada95 binding for the Gimp Toolkit              --
--                                                                   --
--                     Copyright (C) 1998-1999                       --
--        Emmanuel Briot, Joel Brobecker and Arnaud Charlet          --
--                                                                   --
-- This library is free software; you can redistribute it and/or     --
-- modify it under the terms of the GNU General Public               --
-- License as published by the Free Software Foundation; either      --
-- version 2 of the License, or (at your option) any later version.  --
--                                                                   --
-- This library is distributed in the hope that it will be useful,   --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of    --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU --
-- General Public License for more details.                          --
--                                                                   --
-- You should have received a copy of the GNU General Public         --
-- License along with this library; if not, write to the             --
-- Free Software Foundation, Inc., 59 Temple Place - Suite 330,      --
-- Boston, MA 02111-1307, USA.                                       --
--                                                                   --
-- As a special exception, if other files instantiate generics from  --
-- this unit, or you link this unit with other files to produce an   --
-- executable, this  unit  does not  by itself cause  the resulting  --
-- executable to be covered by the GNU General Public License. This  --
-- exception does not however invalidate any other reasons why the   --
-- executable file  might be covered by the  GNU Public License.     --
-----------------------------------------------------------------------

with Gdk; use Gdk;
with GNAT.HTable;

package body Gtk.Util is

   Max_Widgets : constant := 1000;
   --  Maximum number of widgets

   Max_Signals : constant := 1000;
   --  Maximum number of signals

   subtype Hash_Header is Natural range 0 .. 1500;
   --  Number of hash headers, related (for efficiency purposes only)
   --  to the maximum number of widgets.

   type Func_Rec is record
      Func      : Callback;
      Func_Data : System.Address;
   end record;

   No_Func_Rec : constant Func_Rec := (null, System.Null_Address);

   function Hash  (S : String_Ptr) return Hash_Header;
   function Equal (S1, S2 : String_Ptr) return Boolean;
   --  Hash and equality functions for hash table

   package Objects is new GNAT.HTable.Simple_HTable
     (Header_Num => Hash_Header,
      Element    => Gtk.Widget.Gtk_Widget,
      No_Element => null,
      Key        => String_Ptr,
      Hash       => Hash,
      Equal      => Equal);

   package Signals is new GNAT.HTable.Simple_HTable
     (Header_Num => Hash_Header,
      Element    => Func_Rec,
      No_Element => No_Func_Rec,
      Key        => String_Ptr,
      Hash       => Hash,
      Equal      => Equal);

   -----------
   -- Equal --
   -----------

   function Equal (S1, S2 : String_Ptr) return Boolean is
   begin
      return S1.all = S2.all;
   end Equal;

   ----------
   -- Hash --
   ----------

   function Hash (S : String_Ptr) return Hash_Header is
      N : Natural := 0;

   begin
      --  Add up characters of name, mod our table size

      for J in S'Range loop
         N := (N + Character'Pos (S (J))) mod (Hash_Header'Last + 1);
      end loop;

      return N;
   end Hash;

   ----------------
   -- Get_Object --
   ----------------

   function Get_Object (Name : String_Ptr) return Gtk.Widget.Gtk_Widget is
   begin
      return Objects.Get (Name);
   end Get_Object;

   ----------------
   -- Set_Object --
   ----------------

   procedure Set_Object (Name : String_Ptr; Object : Gtk.Widget.Gtk_Widget) is
   begin
      Objects.Set (Name, Object);
   end Set_Object;

   ----------------
   -- Set_Object --
   ----------------

   procedure Set_Object
     (Widget : access Gtk.Widget.Gtk_Widget_Record;
      Object : in     Private_Object) is
   begin
      Set_Object (Widget.all, System.Address (Object));
   end Set_Object;

   ----------------
   -- Set_Signal --
   ----------------

   procedure Set_Signal
     (Name      : in String;
      Func      : in Callback;
      Func_Data : in System.Address) is
   begin
      Signals.Set (new String '(Name), (Func, Func_Data));
   end Set_Signal;

   ----------------
   -- Get_Signal --
   ----------------

   procedure Get_Signal
     (Name      : in     String;
      Func      :    out Callback;
      Func_Data :    out System.Address)
   is
      S   : aliased String := Name;
      Rec : Func_Rec;

   begin
      Rec := Signals.Get (S'Unchecked_Access);
      Func := Rec.Func;
      Func_Data := Rec.Func_Data;
   end Get_Signal;

end Gtk.Util;
