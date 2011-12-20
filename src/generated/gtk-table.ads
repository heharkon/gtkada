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
--  A Gtk_Table is a container that can contain any number of children. Each
--  of them is attached to a specific row and a specific column in widget.
--
--  Every row in the table must have the same height, and every column must
--  have the same width if the table was said as Homogeneous. But you can also
--  decide to have an heterogeneous table, where the width and height are set
--  by the children contained in the table. Check out the Gtk_Sheet widget for
--  a different kind of table that can also contain text and images in a more
--  efficient way.
--
--  </description>
--  <group>Layout containers</group>

pragma Warnings (Off, "*is already use-visible*");
with Glib;            use Glib;
with Glib.Properties; use Glib.Properties;
with Glib.Types;      use Glib.Types;
with Gtk.Buildable;   use Gtk.Buildable;
with Gtk.Container;   use Gtk.Container;
with Gtk.Enums;       use Gtk.Enums;
with Gtk.Widget;      use Gtk.Widget;

package Gtk.Table is

   type Gtk_Table_Record is new Gtk_Container_Record with null record;
   type Gtk_Table is access all Gtk_Table_Record'Class;

   ------------------
   -- Constructors --
   ------------------

   procedure Gtk_New
      (Table       : out Gtk_Table;
       Rows        : Guint;
       Columns     : Guint;
       Homogeneous : Boolean);
   procedure Initialize
      (Table       : access Gtk_Table_Record'Class;
       Rows        : Guint;
       Columns     : Guint;
       Homogeneous : Boolean);
   --  Create a new table. The width allocated to the table is divided into
   --  Columns columns, which all have the same width if Homogeneous is True.
   --  If Homogeneous is False, the width will be calculated with the children
   --  contained in the table. Same behavior for the rows.
   --  "rows": The number of rows the new table should have.
   --  "columns": The number of columns the new table should have.
   --  "homogeneous": If set to True, all table cells are resized to the size
   --  of the cell containing the largest widget.

   function Get_Type return Glib.GType;
   pragma Import (C, Get_Type, "gtk_table_get_type");

   -------------
   -- Methods --
   -------------

   procedure Attach
      (Table         : access Gtk_Table_Record;
       Child         : access Gtk.Widget.Gtk_Widget_Record'Class;
       Left_Attach   : Guint;
       Right_Attach  : Guint;
       Top_Attach    : Guint;
       Bottom_Attach : Guint;
       Xoptions      : Gtk.Enums.Gtk_Attach_Options := Expand or Fill;
       Yoptions      : Gtk.Enums.Gtk_Attach_Options := Expand or Fill;
       Xpadding      : Guint := 0;
       Ypadding      : Guint := 0);
   --  Insert a new widget in the table. All the attachments are relative to
   --  the separations between columns and rows (for instance, to insert a
   --  widget spanning the first two columns in the table, you should put
   --  Left_Attach=0 and Right_Attach=2). Same behavior for the rows. Xoptions
   --  and Yoptions indicate the behavior of the child when the table is
   --  resized (whether the child can shrink or expand). See the description in
   --  Gtk.Box for more information on the possible values. Xpadding and
   --  Ypadding are the amount of space left around the child.
   --  "child": The widget to add.
   --  "left_attach": the column number to attach the left side of a child
   --  widget to.
   --  "right_attach": the column number to attach the right side of a child
   --  widget to.
   --  "top_attach": the row number to attach the top of a child widget to.
   --  "bottom_attach": the row number to attach the bottom of a child widget
   --  to.
   --  "xoptions": Used to specify the properties of the child widget when the
   --  table is resized.
   --  "yoptions": The same as xoptions, except this field determines
   --  behaviour of vertical resizing.
   --  "xpadding": An integer value specifying the padding on the left and
   --  right of the widget being added to the table.
   --  "ypadding": The amount of padding above and below the child widget.

   procedure Attach_Defaults
      (Table         : access Gtk_Table_Record;
       Widget        : access Gtk.Widget.Gtk_Widget_Record'Class;
       Left_Attach   : Guint;
       Right_Attach  : Guint;
       Top_Attach    : Guint;
       Bottom_Attach : Guint);
   --  Insert a new widget in the table, with default values. No padding is
   --  put around the child, and the options are set to Expand and Fill. This
   --  call is similar to Attach with default values and is only provided for
   --  compatibility.
   --  "widget": The child widget to add.
   --  "left_attach": The column number to attach the left side of the child
   --  widget to.
   --  "right_attach": The column number to attach the right side of the child
   --  widget to.
   --  "top_attach": The row number to attach the top of the child widget to.
   --  "bottom_attach": The row number to attach the bottom of the child
   --  widget to.

   function Get_Col_Spacing
      (Table  : access Gtk_Table_Record;
       Column : Guint) return Guint;
   procedure Set_Col_Spacing
      (Table   : access Gtk_Table_Record;
       Column  : Guint;
       Spacing : Guint);
   --  Set the spacing in pixels between Column and the next one.
   --  "column": the column whose spacing should be changed.
   --  "spacing": number of pixels that the spacing should take up.

   function Get_Default_Col_Spacing
      (Table : access Gtk_Table_Record) return Guint;
   --  Gets the default column spacing for the table. This is the spacing that
   --  will be used for newly added columns. (See Gtk.Table.Set_Col_Spacings)

   function Get_Default_Row_Spacing
      (Table : access Gtk_Table_Record) return Guint;
   --  Gets the default row spacing for the table. This is the spacing that
   --  will be used for newly added rows. (See Gtk.Table.Set_Row_Spacings)

   function Get_Homogeneous (Table : access Gtk_Table_Record) return Boolean;
   procedure Set_Homogeneous
      (Table       : access Gtk_Table_Record;
       Homogeneous : Boolean);
   --  Indicate the homogeneous status of the table. If Homogeneous is True,
   --  the rows and columns of the table will all be allocated the same width
   --  or height.
   --  "homogeneous": Set to True to ensure all table cells are the same size.
   --  Set to False if this is not your desired behaviour.

   function Get_Row_Spacing
      (Table : access Gtk_Table_Record;
       Row   : Guint) return Guint;
   procedure Set_Row_Spacing
      (Table   : access Gtk_Table_Record;
       Row     : Guint;
       Spacing : Guint);
   --  Changes the space between a given table row and the subsequent row.
   --  "row": row number whose spacing will be changed.
   --  "spacing": number of pixels that the spacing should take up.

   procedure Get_Size
      (Table   : access Gtk_Table_Record;
       Rows    : out Guint;
       Columns : out Guint);
   --  Gets the number of rows and columns in the table.
   --  Since: gtk+ 2.22
   --  "rows": return location for the number of rows, or null
   --  "columns": return location for the number of columns, or null

   procedure Resize
      (Table   : access Gtk_Table_Record;
       Rows    : Guint;
       Columns : Guint);
   --  If you need to change a table's size <emphasis>after</emphasis> it has
   --  been created, this function allows you to do so.
   --  "rows": The new number of rows.
   --  "columns": The new number of columns.

   procedure Set_Col_Spacings
      (Table   : access Gtk_Table_Record;
       Spacing : Guint);
   --  Sets the space between every column in Table equal to Spacing.
   --  "spacing": the number of pixels of space to place between every column
   --  in the table.

   procedure Set_Row_Spacings
      (Table   : access Gtk_Table_Record;
       Spacing : Guint);
   --  Sets the space between every row in Table equal to Spacing.
   --  "spacing": the number of pixels of space to place between every row in
   --  the table.

   ----------------
   -- Interfaces --
   ----------------
   --  This class implements several interfaces. See Glib.Types
   --
   --  - "Buildable"

   package Implements_Buildable is new Glib.Types.Implements
     (Gtk.Buildable.Gtk_Buildable, Gtk_Table_Record, Gtk_Table);
   function "+"
     (Widget : access Gtk_Table_Record'Class)
   return Gtk.Buildable.Gtk_Buildable
   renames Implements_Buildable.To_Interface;
   function "-"
     (Interf : Gtk.Buildable.Gtk_Buildable)
   return Gtk_Table
   renames Implements_Buildable.To_Object;

   ----------------
   -- Properties --
   ----------------
   --  The following properties are defined for this widget. See
   --  Glib.Properties for more information on properties)
   --
   --  Name: Column_Spacing_Property
   --  Type: Guint
   --  Flags: read-write
   --
   --  Name: Homogeneous_Property
   --  Type: Boolean
   --  Flags: read-write
   --
   --  Name: N_Columns_Property
   --  Type: Guint
   --  Flags: read-write
   --
   --  Name: N_Rows_Property
   --  Type: Guint
   --  Flags: read-write
   --
   --  Name: Row_Spacing_Property
   --  Type: Guint
   --  Flags: read-write

   Column_Spacing_Property : constant Glib.Properties.Property_Uint;
   Homogeneous_Property : constant Glib.Properties.Property_Boolean;
   N_Columns_Property : constant Glib.Properties.Property_Uint;
   N_Rows_Property : constant Glib.Properties.Property_Uint;
   Row_Spacing_Property : constant Glib.Properties.Property_Uint;

private
   Column_Spacing_Property : constant Glib.Properties.Property_Uint :=
     Glib.Properties.Build ("column-spacing");
   Homogeneous_Property : constant Glib.Properties.Property_Boolean :=
     Glib.Properties.Build ("homogeneous");
   N_Columns_Property : constant Glib.Properties.Property_Uint :=
     Glib.Properties.Build ("n-columns");
   N_Rows_Property : constant Glib.Properties.Property_Uint :=
     Glib.Properties.Build ("n-rows");
   Row_Spacing_Property : constant Glib.Properties.Property_Uint :=
     Glib.Properties.Build ("row-spacing");
end Gtk.Table;
