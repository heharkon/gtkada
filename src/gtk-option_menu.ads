-----------------------------------------------------------------------
--          GtkAda - Ada95 binding for the Gimp Toolkit              --
--                                                                   --
-- Copyright (C) 1998 Emmanuel Briot and Joel Brobecker              --
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

with Gtk.Button;
with Gtk.Menu;
with Gtk.Widget;

package Gtk.Option_Menu is

   type Gtk_Option_Menu is new Button.Gtk_Button with private;


   procedure Gtk_New (Option_Menu : out Gtk_Option_Menu);

   function Get_Menu (Option_Menu : in  Gtk_Option_Menu)
                      return Gtk.Menu.Gtk_Menu;

   procedure Set_Menu (Option_Menu : in out Gtk_Option_Menu;
                       Menu        : in     Widget.Gtk_Widget'Class);

   procedure Remove_Menu (Option_Menu : in out Gtk_Option_Menu;
                          Menu        : in     Widget.Gtk_Widget'Class);

   procedure Set_History (Option_Menu : in out Gtk_Option_Menu;
                          Index       : in     Gint);


private
   type Gtk_Option_Menu is new Button.Gtk_Button with null record;

end Gtk.Option_Menu;
