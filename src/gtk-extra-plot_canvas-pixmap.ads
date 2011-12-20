------------------------------------------------------------------------------
--                  GtkAda - Ada95 binding for Gtk+/Gnome                   --
--                                                                          --
--                     Copyright (C) 2000-2012, AdaCore                     --
--                                                                          --
-- This library is free software;  you can redistribute it and/or modify it --
-- under terms of the  GNU General Public License  as published by the Free --
-- Software  Foundation;  either version 3,  or (at your  option) any later --
-- version. This library is distributed in the hope that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE.                            --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
------------------------------------------------------------------------------

--  <description>
--  A special kind of child that can be put in a Gtk_Plot_Canvas.
--  </description>
--  <c_version>gtkextra 2.1.1</c_version>
--  <group>Plotting Data</group>

with Gdk.Bitmap;
with Gdk.Pixmap;

package Gtk.Extra.Plot_Canvas.Pixmap is

   type Gtk_Plot_Canvas_Pixmap_Record is new Gtk_Plot_Canvas_Child_Record
     with private;
   type Gtk_Plot_Canvas_Pixmap is access
     all Gtk_Plot_Canvas_Pixmap_Record'Class;

   procedure Gtk_New
     (Child    : out Gtk_Plot_Canvas_Pixmap;
      Pixmap   : Gdk.Pixmap.Gdk_Pixmap;
      Mask     : Gdk.Bitmap.Gdk_Bitmap);

   function Get_Type return Gtk.Gtk_Type;
   --  Return the internal value associated with a Gtk_Plot.

private
   type Gtk_Plot_Canvas_Pixmap_Record is new Gtk_Plot_Canvas_Child_Record
      with null record;

   pragma Import (C, Get_Type, "gtk_plot_canvas_pixmap_get_type");
end Gtk.Extra.Plot_Canvas.Pixmap;
