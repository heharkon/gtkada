------------------------------------------------------------------------------
--                                                                          --
--      Copyright (C) 1998-2000 E. Briot, J. Brobecker and A. Charlet       --
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
--  This widget provides a nice way for the user of your application to select
--  fonts. It first searches on your system for the list of fonts available,
--  and displays a set of boxes to select them based on their name, their
--  weight, their size, etc. This widget is provided in two forms, one widget
--  that can be embedded in any container, a Gtk_Font_Selection, whereas the
--  other one comes directly in its own separate window (to be popped up as a
--  dialog).
--
--  Some filters can be applied to the widget, when you want the user to
--  select only a font only among a specific subset (like bitmap or true-type
--  fonts for instance). There are two kinds of filters: a base filter, set in
--  your application and that the user can not change; a user filter that can
--  be modified interactively by the user.
--
--  </description>
--  <screenshot>gtk-fontsel</screenshot>
--  <group>Selectors</group>
--  <testgtk>create_font_selection.adb</testgtk>

pragma Warnings (Off, "*is already use-visible*");
with Glib;            use Glib;
with Glib.Properties; use Glib.Properties;
with Glib.Types;      use Glib.Types;
with Gtk.Box;         use Gtk.Box;
with Gtk.Buildable;   use Gtk.Buildable;
with Gtk.Enums;       use Gtk.Enums;
with Gtk.Orientable;  use Gtk.Orientable;
with Gtk.Widget;      use Gtk.Widget;

package Gtk.Font_Selection is

   type Gtk_Font_Selection_Record is new Gtk_Box_Record with null record;
   type Gtk_Font_Selection is access all Gtk_Font_Selection_Record'Class;

   ------------------
   -- Constructors --
   ------------------

   procedure Gtk_New (Fontsel : out Gtk_Font_Selection);
   procedure Initialize (Fontsel : access Gtk_Font_Selection_Record'Class);
   --  Creates a new Gtk.Font_Selection.Gtk_Font_Selection.

   function Get_Type return Glib.GType;
   pragma Import (C, Get_Type, "gtk_font_selection_get_type");

   -------------
   -- Methods --
   -------------

   function Get_Face_List
      (Fontsel : access Gtk_Font_Selection_Record)
       return Gtk.Widget.Gtk_Widget;
   pragma Obsolescent (Get_Face_List);
   --  This returns the Gtk.Treeview.Gtk_Treeview which lists all styles
   --  available for the selected font. For example, 'Regular', 'Bold', etc.
   --  Since: gtk+ 2.14
   --  Deprecated since 3.2, Use Gtk.Fontchooser.Gtk_Fontchooser

   function Get_Family_List
      (Fontsel : access Gtk_Font_Selection_Record)
       return Gtk.Widget.Gtk_Widget;
   pragma Obsolescent (Get_Family_List);
   --  This returns the Gtk.Treeview.Gtk_Treeview that lists font families,
   --  for example, 'Sans', 'Serif', etc.
   --  Since: gtk+ 2.14
   --  Deprecated since 3.2, Use Gtk.Fontchooser.Gtk_Fontchooser

   function Get_Font_Name
      (Fontsel : access Gtk_Font_Selection_Record) return UTF8_String;
   pragma Obsolescent (Get_Font_Name);
   function Set_Font_Name
      (Fontsel  : access Gtk_Font_Selection_Record;
       Fontname : UTF8_String) return Boolean;
   pragma Obsolescent (Set_Font_Name);
   --  Sets the currently-selected font. Note that the Fontsel needs to know
   --  the screen in which it will appear for this to work; this can be
   --  guaranteed by simply making sure that the such font exists or if the
   --  Fontsel doesn't belong to a particular screen yet.
   --  Deprecated since 3.2, Use Gtk.Fontchooser.Gtk_Fontchooser
   --  "fontname": a font name like "Helvetica 12" or "Times Bold 18"

   function Get_Preview_Entry
      (Fontsel : access Gtk_Font_Selection_Record)
       return Gtk.Widget.Gtk_Widget;
   pragma Obsolescent (Get_Preview_Entry);
   --  This returns the Gtk.GEntry.Gtk_Entry used to display the font as a
   --  preview.
   --  Since: gtk+ 2.14
   --  Deprecated since 3.2, Use Gtk.Fontchooser.Gtk_Fontchooser

   function Get_Preview_Text
      (Fontsel : access Gtk_Font_Selection_Record) return UTF8_String;
   pragma Obsolescent (Get_Preview_Text);
   procedure Set_Preview_Text
      (Fontsel : access Gtk_Font_Selection_Record;
       Text    : UTF8_String);
   pragma Obsolescent (Set_Preview_Text);
   --  Sets the text displayed in the preview area. The Text is used to show
   --  how the selected font looks.
   --  Deprecated since 3.2, Use Gtk.Fontchooser.Gtk_Fontchooser
   --  "text": the text to display in the preview area

   function Get_Size
      (Fontsel : access Gtk_Font_Selection_Record) return Gint;
   pragma Obsolescent (Get_Size);
   --  The selected font size. or -1 if no font size is selected.
   --  Since: gtk+ 2.14
   --  Deprecated since 3.2, Use Gtk.Fontchooser.Gtk_Fontchooser

   function Get_Size_Entry
      (Fontsel : access Gtk_Font_Selection_Record)
       return Gtk.Widget.Gtk_Widget;
   pragma Obsolescent (Get_Size_Entry);
   --  This returns the Gtk.GEntry.Gtk_Entry used to allow the user to edit
   --  the font number manually instead of selecting it from the list of font
   --  sizes.
   --  Since: gtk+ 2.14
   --  Deprecated since 3.2, Use Gtk.Fontchooser.Gtk_Fontchooser

   function Get_Size_List
      (Fontsel : access Gtk_Font_Selection_Record)
       return Gtk.Widget.Gtk_Widget;
   pragma Obsolescent (Get_Size_List);
   --  This returns the GtkTreeeView used to list font sizes.
   --  Since: gtk+ 2.14
   --  Deprecated since 3.2, Use Gtk.Fontchooser.Gtk_Fontchooser

   ---------------------
   -- Interfaces_Impl --
   ---------------------

   function Get_Orientation
      (Self : access Gtk_Font_Selection_Record)
       return Gtk.Enums.Gtk_Orientation;
   procedure Set_Orientation
      (Self        : access Gtk_Font_Selection_Record;
       Orientation : Gtk.Enums.Gtk_Orientation);

   ----------------
   -- Interfaces --
   ----------------
   --  This class implements several interfaces. See Glib.Types
   --
   --  - "Buildable"
   --
   --  - "Orientable"

   package Implements_Buildable is new Glib.Types.Implements
     (Gtk.Buildable.Gtk_Buildable, Gtk_Font_Selection_Record, Gtk_Font_Selection);
   function "+"
     (Widget : access Gtk_Font_Selection_Record'Class)
   return Gtk.Buildable.Gtk_Buildable
   renames Implements_Buildable.To_Interface;
   function "-"
     (Interf : Gtk.Buildable.Gtk_Buildable)
   return Gtk_Font_Selection
   renames Implements_Buildable.To_Object;

   package Implements_Orientable is new Glib.Types.Implements
     (Gtk.Orientable.Gtk_Orientable, Gtk_Font_Selection_Record, Gtk_Font_Selection);
   function "+"
     (Widget : access Gtk_Font_Selection_Record'Class)
   return Gtk.Orientable.Gtk_Orientable
   renames Implements_Orientable.To_Interface;
   function "-"
     (Interf : Gtk.Orientable.Gtk_Orientable)
   return Gtk_Font_Selection
   renames Implements_Orientable.To_Object;

   ----------------
   -- Properties --
   ----------------
   --  The following properties are defined for this widget. See
   --  Glib.Properties for more information on properties)
   --
   --  Name: Font_Name_Property
   --  Type: UTF8_String
   --  Flags: read-write
   --
   --  Name: Preview_Text_Property
   --  Type: UTF8_String
   --  Flags: read-write

   Font_Name_Property : constant Glib.Properties.Property_String;
   Preview_Text_Property : constant Glib.Properties.Property_String;

private
   Font_Name_Property : constant Glib.Properties.Property_String :=
     Glib.Properties.Build ("font-name");
   Preview_Text_Property : constant Glib.Properties.Property_String :=
     Glib.Properties.Build ("preview-text");
end Gtk.Font_Selection;