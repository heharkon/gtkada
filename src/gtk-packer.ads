-----------------------------------------------------------------------
--               GtkAda - Ada95 binding for Gtk+/Gnome               --
--                                                                   --
--   Copyright (C) 1998-2000 E. Briot, J. Brobecker and A. Charlet   --
--                Copyright (C) 2000-2001 ACT-Europe                 --
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

--  <description>
--
--  A Gtk_Packer is a container that organizes its children according
--  to a given location (North, East, South, West or any combination of
--  them).
--
--  The children can be set to expand and/or fill their assigned location.
--
--  </description>
--  <c_version>1.3.6</c_version>

with Gdk;
with Gtk.Container;
with Gtk.Enums; use Gtk.Enums;
with Gtk.Widget;

package Gtk.Packer is

   type Gtk_Packer_Record is new
     Gtk.Container.Gtk_Container_Record with private;
   type Gtk_Packer is access all Gtk_Packer_Record'Class;

   type Gtk_Packer_Options is new Guint;
   --  Indicate how the child should fill its allocated area.
   --
   --  If Gtk_Pack_Expand is set, the child allocated area is expanded to
   --  occupy the whole width (or height) or the Package. The orientation
   --  depends on the side of the child (if Top or Bottom, the expansion
   --  is done vertically, otherwise it is done horizontally).
   --
   --  If Gtk_Fill_X or Gtk_Fill_Y is set, the child is resized till it
   --  occupies all the area allocated to it.
   --  If the side of the widget is top or bottom, the widget can always
   --  be filled horizontally with Gtk_Fill_X (and will thus be as wide as
   --  the Gtk_Packer itself. However, it can be filled vertically with
   --  Gtk_Fill_Y only if Gtk_Pack_Expand is set.

   Gtk_No_Options  : constant Gtk_Packer_Options;
   Gtk_Pack_Expand : constant Gtk_Packer_Options;
   Gtk_Fill_X      : constant Gtk_Packer_Options;
   Gtk_Fill_Y      : constant Gtk_Packer_Options;

   --------------------------
   -- Modifying the Packer --
   --------------------------

   procedure Gtk_New (Widget : out Gtk_Packer);
   --  Create a new empty packer.

   procedure Initialize (Widget : access Gtk_Packer_Record'Class);
   --  Internal initialization function.
   --  See the section "Creating your own widgets" in the documentation.

   function Get_Type return Gtk.Gtk_Type;
   --  Return the internal value associated with a Gtk_Packer.

   procedure Add_Defaults
     (Packer  : access Gtk_Packer_Record;
      Child   : access Gtk.Widget.Gtk_Widget_Record'Class;
      Side    : Gtk_Side_Type;
      Anchor  : Gtk_Anchor_Type;
      Options : Gtk_Packer_Options);
   --  Add a new child in the container, with default values for its border
   --  width and its padding.
   --  See Gtk_Size_Type, Gtk_Anchor_Type and Gtk_Packer_Options above for
   --  more information on these types.

   procedure Add
     (Packer       : access Gtk_Packer_Record;
      Child        : access Gtk.Widget.Gtk_Widget_Record'Class;
      Side         : Gtk_Side_Type;
      Anchor       : Gtk_Anchor_Type;
      Options      : Gtk_Packer_Options;
      Border_Width : Guint;
      Pad_X        : Guint;
      Pad_Y        : Guint;
      I_Pad_X      : Guint;
      I_Pad_Y      : Guint);
   --  Add a new child in the container.
   --  See Gtk_Size_Type, Gtk_Anchor_Type and Gtk_Packer_Options above for
   --  more information on these types.
   --
   --  Border_Width is the space left on each side of the child.
   --  Pad_X is additional space left on each horizontal side of the child
   --     when it is not centered (the anchor is NE, E, NW, SW, W, SE)
   --  Pad_Y is additional space left on each vertical side of the child
   --     when it is not centered (the anchor is NW, N, NE, SE, S, SW)
   --  I_Pad_X is additional space left on each horizontal side of the
   --     child when it is on the borders (anchor is N, Center, S)
   --  I_Pad_Y is additional space left on each vertical side of the
   --     child when it is on the borders (anchor is E, Center, W)

   procedure Set_Child_Packing
     (Packer       : access Gtk_Packer_Record;
      Child        : access Gtk.Widget.Gtk_Widget_Record'Class;
      Side         : Gtk_Side_Type;
      Anchor       : Gtk_Anchor_Type;
      Options      : Gtk_Packer_Options;
      Border_Width : Guint;
      Pad_X        : Guint;
      Pad_Y        : Guint;
      I_Pad_X      : Guint;
      I_Pad_Y      : Guint);
   --  Change the packing options for Child.
   --  See the documentation for Add above for more information on the
   --  parameters.
   --  Nothing is done if Child is not contained in Packer.

   procedure Reorder_Child
     (Packer   : access Gtk_Packer_Record;
      Child    : access Gtk.Widget.Gtk_Widget_Record'Class;
      Position : Gint);
   --  Change the position of the child in the list of children.
   --  As seen in the explanation of the packing parameters, the order of
   --  the children is important, since each child inserted limits the space
   --  available to the next children in the list.

   --  <doc_ignore>

   procedure Set_Spacing (Packer : access Gtk_Packer_Record; Spacing : Guint);
   --  Modify the spacing for the packer.
   --  This parameter does not seem to be used in the gtk+ sources, you should
   --  be able to safely ignore it.

   --  </doc_ignore>

   procedure Set_Default_Border_Width
     (Packer : access Gtk_Packer_Record; Border : Guint);
   --  Modify the default border width for all the children of Packer.
   --  This is the border_width that is used by Add_Defaults above.
   --  Its default value is 0.

   procedure Set_Default_Pad
     (Packer : access Gtk_Packer_Record;
      Pad_X  : Guint;
      Pad_Y  : Guint);
   --  Set the default Padding for all the children of Packer.
   --  This is the value used by Add_Defaults above.
   --  The default values are 0.

   procedure Set_Default_Ipad
     (Packer  : access Gtk_Packer_Record;
      I_Pad_X : Guint;
      I_Pad_Y : Guint);
   --  Set the default Ipadding for all the children of Packer.
   --  This is the value used by Add_Defaults above.
   --  The default values are 0.

   ------------------------
   -- Accessing children --
   ------------------------
   --  Some functions give access to the children of a Gtk_Packer.
   --  You can not use the standard Gtk.Container.Children function as is,
   --  since the children are not exactly widgets but more complicated
   --  structures. In C, one would use a direct access to the fields of
   --  the packer, and then do some type-casting, which is what we are
   --  trying to avoid in Ada.

   type Gtk_Packer_Child is new Gdk.C_Proxy;
   --  A child of the packer.
   --  It includes both the widget and its position in the packer.

   Null_Packer_Child : constant Gtk_Packer_Child;

   function Find_Child
     (Packer : access Gtk_Packer_Record;
      Child  : access Gtk.Widget.Gtk_Widget_Record'Class)
      return Gtk_Packer_Child;
   --  Return the child of Packer that is associated with the widget Child.
   --  Null_Packer_Child will be returned if Child is not contained in Packer.

   function Get_Nth_Child
     (Packer : access Gtk_Packer_Record;
      N      : Guint) return Gtk_Packer_Child;
   --  Returns the Nth child of the packer.
   --  The first child is found at index 1.
   --  Null_Packer_Child will be returned if there is no such child in Packer.

   function Get_Anchor (Child : Gtk_Packer_Child) return Gtk_Anchor_Type;
   --  Return the Anchor type for the child.

   function Get_Side (Child : Gtk_Packer_Child) return Gtk_Side_Type;
   --  Return the side of the child.

   function Get_Options (Chlid : Gtk_Packer_Child) return Gtk_Packer_Options;
   --  Return the options set for the child.

   function Get_Border_Width (Child : Gtk_Packer_Child) return Guint;
   --  Return the border width for the child.

   function Get_Pad_X (Child : Gtk_Packer_Child) return Guint;
   --  Return the X padding for the child (when on the borders).

   function Get_Pad_Y (Child : Gtk_Packer_Child) return Guint;
   --  Return the Y padding for the child (when on the borders).

   function Get_I_Pad_X (Child : Gtk_Packer_Child) return Guint;
   --  Return the X i_padding for the child (when not on the borders).

   function Get_I_Pad_Y (Child : Gtk_Packer_Child) return Guint;
   --  Return the Y i_padding for the child (when not on the borders).

   ----------------
   -- Properties --
   ----------------

   --  <properties>
   --  The following properties are defined for this widget. See
   --  Glib.Properties for more information on properties.
   --
   --  </properties>

private
   type Gtk_Packer_Record is new Gtk.Container.Gtk_Container_Record
     with null record;
   Null_Packer_Child : constant Gtk_Packer_Child := null;

   Gtk_No_Options  : constant Gtk_Packer_Options := 0;
   Gtk_Pack_Expand : constant Gtk_Packer_Options := 2 ** 0;
   Gtk_Fill_X      : constant Gtk_Packer_Options := 2 ** 1;
   Gtk_Fill_Y      : constant Gtk_Packer_Options := 2 ** 2;
   pragma Import (C, Get_Type, "gtk_button_get_type");
   pragma Import (C, Get_Anchor, "ada_gtk_packer_get_anchor");
   pragma Import (C, Get_Side, "ada_gtk_packer_get_side");
   pragma Import (C, Get_Options, "ada_gtk_packer_get_options");
   pragma Import (C, Get_Border_Width, "ada_gtk_packer_get_border_width");
   pragma Import (C, Get_Pad_X, "ada_gtk_packer_get_pad_x");
   pragma Import (C, Get_Pad_Y, "ada_gtk_packer_get_pad_y");
   pragma Import (C, Get_I_Pad_X, "ada_gtk_packer_get_i_pad_x");
   pragma Import (C, Get_I_Pad_Y, "ada_gtk_packer_get_i_pad_y");
end Gtk.Packer;
