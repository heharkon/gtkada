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

pragma Style_Checks (Off);
pragma Warnings (Off, "*is already use-visible*");
with Glib.Type_Conversion_Hooks; use Glib.Type_Conversion_Hooks;

package body Gtk.GRange is

   package Type_Conversion is new Glib.Type_Conversion_Hooks.Hook_Registrator
     (Get_Type'Access, Gtk_Range_Record);
   pragma Unreferenced (Type_Conversion);

   --------------------
   -- Get_Adjustment --
   --------------------

   function Get_Adjustment
      (The_Range : access Gtk_Range_Record)
       return Gtk.Adjustment.Gtk_Adjustment
   is
      function Internal (The_Range : System.Address) return System.Address;
      pragma Import (C, Internal, "gtk_range_get_adjustment");
      Stub_Gtk_Adjustment : Gtk.Adjustment.Gtk_Adjustment_Record;
   begin
      return Gtk.Adjustment.Gtk_Adjustment (Get_User_Data (Internal (Get_Object (The_Range)), Stub_Gtk_Adjustment));
   end Get_Adjustment;

   --------------------
   -- Get_Fill_Level --
   --------------------

   function Get_Fill_Level
      (The_Range : access Gtk_Range_Record) return Gdouble
   is
      function Internal (The_Range : System.Address) return Gdouble;
      pragma Import (C, Internal, "gtk_range_get_fill_level");
   begin
      return Internal (Get_Object (The_Range));
   end Get_Fill_Level;

   -------------------
   -- Get_Flippable --
   -------------------

   function Get_Flippable
      (The_Range : access Gtk_Range_Record) return Boolean
   is
      function Internal (The_Range : System.Address) return Integer;
      pragma Import (C, Internal, "gtk_range_get_flippable");
   begin
      return Boolean'Val (Internal (Get_Object (The_Range)));
   end Get_Flippable;

   ------------------
   -- Get_Inverted --
   ------------------

   function Get_Inverted
      (The_Range : access Gtk_Range_Record) return Boolean
   is
      function Internal (The_Range : System.Address) return Integer;
      pragma Import (C, Internal, "gtk_range_get_inverted");
   begin
      return Boolean'Val (Internal (Get_Object (The_Range)));
   end Get_Inverted;

   -----------------------------------
   -- Get_Lower_Stepper_Sensitivity --
   -----------------------------------

   function Get_Lower_Stepper_Sensitivity
      (The_Range : access Gtk_Range_Record)
       return Gtk.Enums.Gtk_Sensitivity_Type
   is
      function Internal (The_Range : System.Address) return Integer;
      pragma Import (C, Internal, "gtk_range_get_lower_stepper_sensitivity");
   begin
      return Gtk.Enums.Gtk_Sensitivity_Type'Val (Internal (Get_Object (The_Range)));
   end Get_Lower_Stepper_Sensitivity;

   -------------------------
   -- Get_Min_Slider_Size --
   -------------------------

   function Get_Min_Slider_Size
      (The_Range : access Gtk_Range_Record) return Gint
   is
      function Internal (The_Range : System.Address) return Gint;
      pragma Import (C, Internal, "gtk_range_get_min_slider_size");
   begin
      return Internal (Get_Object (The_Range));
   end Get_Min_Slider_Size;

   --------------------
   -- Get_Range_Rect --
   --------------------

   procedure Get_Range_Rect
      (The_Range  : access Gtk_Range_Record;
       Range_Rect : out Gdk.Rectangle.Gdk_Rectangle)
   is
      procedure Internal
         (The_Range  : System.Address;
          Range_Rect : out Gdk.Rectangle.Gdk_Rectangle);
      pragma Import (C, Internal, "gtk_range_get_range_rect");
   begin
      Internal (Get_Object (The_Range), Range_Rect);
   end Get_Range_Rect;

   --------------------------------
   -- Get_Restrict_To_Fill_Level --
   --------------------------------

   function Get_Restrict_To_Fill_Level
      (The_Range : access Gtk_Range_Record) return Boolean
   is
      function Internal (The_Range : System.Address) return Integer;
      pragma Import (C, Internal, "gtk_range_get_restrict_to_fill_level");
   begin
      return Boolean'Val (Internal (Get_Object (The_Range)));
   end Get_Restrict_To_Fill_Level;

   ----------------------
   -- Get_Round_Digits --
   ----------------------

   function Get_Round_Digits
      (The_Range : access Gtk_Range_Record) return Gint
   is
      function Internal (The_Range : System.Address) return Gint;
      pragma Import (C, Internal, "gtk_range_get_round_digits");
   begin
      return Internal (Get_Object (The_Range));
   end Get_Round_Digits;

   -------------------------
   -- Get_Show_Fill_Level --
   -------------------------

   function Get_Show_Fill_Level
      (The_Range : access Gtk_Range_Record) return Boolean
   is
      function Internal (The_Range : System.Address) return Integer;
      pragma Import (C, Internal, "gtk_range_get_show_fill_level");
   begin
      return Boolean'Val (Internal (Get_Object (The_Range)));
   end Get_Show_Fill_Level;

   ----------------------
   -- Get_Slider_Range --
   ----------------------

   procedure Get_Slider_Range
      (The_Range    : access Gtk_Range_Record;
       Slider_Start : out Gint;
       Slider_End   : out Gint)
   is
      procedure Internal
         (The_Range    : System.Address;
          Slider_Start : out Gint;
          Slider_End   : out Gint);
      pragma Import (C, Internal, "gtk_range_get_slider_range");
   begin
      Internal (Get_Object (The_Range), Slider_Start, Slider_End);
   end Get_Slider_Range;

   ---------------------------
   -- Get_Slider_Size_Fixed --
   ---------------------------

   function Get_Slider_Size_Fixed
      (The_Range : access Gtk_Range_Record) return Boolean
   is
      function Internal (The_Range : System.Address) return Integer;
      pragma Import (C, Internal, "gtk_range_get_slider_size_fixed");
   begin
      return Boolean'Val (Internal (Get_Object (The_Range)));
   end Get_Slider_Size_Fixed;

   -----------------------------------
   -- Get_Upper_Stepper_Sensitivity --
   -----------------------------------

   function Get_Upper_Stepper_Sensitivity
      (The_Range : access Gtk_Range_Record)
       return Gtk.Enums.Gtk_Sensitivity_Type
   is
      function Internal (The_Range : System.Address) return Integer;
      pragma Import (C, Internal, "gtk_range_get_upper_stepper_sensitivity");
   begin
      return Gtk.Enums.Gtk_Sensitivity_Type'Val (Internal (Get_Object (The_Range)));
   end Get_Upper_Stepper_Sensitivity;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value (The_Range : access Gtk_Range_Record) return Gdouble is
      function Internal (The_Range : System.Address) return Gdouble;
      pragma Import (C, Internal, "gtk_range_get_value");
   begin
      return Internal (Get_Object (The_Range));
   end Get_Value;

   --------------------
   -- Set_Adjustment --
   --------------------

   procedure Set_Adjustment
      (The_Range  : access Gtk_Range_Record;
       Adjustment : access Gtk.Adjustment.Gtk_Adjustment_Record'Class)
   is
      procedure Internal
         (The_Range  : System.Address;
          Adjustment : System.Address);
      pragma Import (C, Internal, "gtk_range_set_adjustment");
   begin
      Internal (Get_Object (The_Range), Get_Object (Adjustment));
   end Set_Adjustment;

   --------------------
   -- Set_Fill_Level --
   --------------------

   procedure Set_Fill_Level
      (The_Range  : access Gtk_Range_Record;
       Fill_Level : Gdouble)
   is
      procedure Internal (The_Range : System.Address; Fill_Level : Gdouble);
      pragma Import (C, Internal, "gtk_range_set_fill_level");
   begin
      Internal (Get_Object (The_Range), Fill_Level);
   end Set_Fill_Level;

   -------------------
   -- Set_Flippable --
   -------------------

   procedure Set_Flippable
      (The_Range : access Gtk_Range_Record;
       Flippable : Boolean)
   is
      procedure Internal (The_Range : System.Address; Flippable : Integer);
      pragma Import (C, Internal, "gtk_range_set_flippable");
   begin
      Internal (Get_Object (The_Range), Boolean'Pos (Flippable));
   end Set_Flippable;

   --------------------
   -- Set_Increments --
   --------------------

   procedure Set_Increments
      (The_Range : access Gtk_Range_Record;
       Step      : Gdouble;
       Page      : Gdouble)
   is
      procedure Internal
         (The_Range : System.Address;
          Step      : Gdouble;
          Page      : Gdouble);
      pragma Import (C, Internal, "gtk_range_set_increments");
   begin
      Internal (Get_Object (The_Range), Step, Page);
   end Set_Increments;

   ------------------
   -- Set_Inverted --
   ------------------

   procedure Set_Inverted
      (The_Range : access Gtk_Range_Record;
       Setting   : Boolean)
   is
      procedure Internal (The_Range : System.Address; Setting : Integer);
      pragma Import (C, Internal, "gtk_range_set_inverted");
   begin
      Internal (Get_Object (The_Range), Boolean'Pos (Setting));
   end Set_Inverted;

   -----------------------------------
   -- Set_Lower_Stepper_Sensitivity --
   -----------------------------------

   procedure Set_Lower_Stepper_Sensitivity
      (The_Range   : access Gtk_Range_Record;
       Sensitivity : Gtk.Enums.Gtk_Sensitivity_Type)
   is
      procedure Internal (The_Range : System.Address; Sensitivity : Integer);
      pragma Import (C, Internal, "gtk_range_set_lower_stepper_sensitivity");
   begin
      Internal (Get_Object (The_Range), Gtk.Enums.Gtk_Sensitivity_Type'Pos (Sensitivity));
   end Set_Lower_Stepper_Sensitivity;

   -------------------------
   -- Set_Min_Slider_Size --
   -------------------------

   procedure Set_Min_Slider_Size
      (The_Range : access Gtk_Range_Record;
       Min_Size  : Gint)
   is
      procedure Internal (The_Range : System.Address; Min_Size : Gint);
      pragma Import (C, Internal, "gtk_range_set_min_slider_size");
   begin
      Internal (Get_Object (The_Range), Min_Size);
   end Set_Min_Slider_Size;

   ---------------
   -- Set_Range --
   ---------------

   procedure Set_Range
      (The_Range : access Gtk_Range_Record;
       Min       : Gdouble;
       Max       : Gdouble)
   is
      procedure Internal
         (The_Range : System.Address;
          Min       : Gdouble;
          Max       : Gdouble);
      pragma Import (C, Internal, "gtk_range_set_range");
   begin
      Internal (Get_Object (The_Range), Min, Max);
   end Set_Range;

   --------------------------------
   -- Set_Restrict_To_Fill_Level --
   --------------------------------

   procedure Set_Restrict_To_Fill_Level
      (The_Range              : access Gtk_Range_Record;
       Restrict_To_Fill_Level : Boolean)
   is
      procedure Internal
         (The_Range              : System.Address;
          Restrict_To_Fill_Level : Integer);
      pragma Import (C, Internal, "gtk_range_set_restrict_to_fill_level");
   begin
      Internal (Get_Object (The_Range), Boolean'Pos (Restrict_To_Fill_Level));
   end Set_Restrict_To_Fill_Level;

   ----------------------
   -- Set_Round_Digits --
   ----------------------

   procedure Set_Round_Digits
      (The_Range    : access Gtk_Range_Record;
       Round_Digits : Gint)
   is
      procedure Internal (The_Range : System.Address; Round_Digits : Gint);
      pragma Import (C, Internal, "gtk_range_set_round_digits");
   begin
      Internal (Get_Object (The_Range), Round_Digits);
   end Set_Round_Digits;

   -------------------------
   -- Set_Show_Fill_Level --
   -------------------------

   procedure Set_Show_Fill_Level
      (The_Range       : access Gtk_Range_Record;
       Show_Fill_Level : Boolean)
   is
      procedure Internal
         (The_Range       : System.Address;
          Show_Fill_Level : Integer);
      pragma Import (C, Internal, "gtk_range_set_show_fill_level");
   begin
      Internal (Get_Object (The_Range), Boolean'Pos (Show_Fill_Level));
   end Set_Show_Fill_Level;

   ---------------------------
   -- Set_Slider_Size_Fixed --
   ---------------------------

   procedure Set_Slider_Size_Fixed
      (The_Range  : access Gtk_Range_Record;
       Size_Fixed : Boolean)
   is
      procedure Internal (The_Range : System.Address; Size_Fixed : Integer);
      pragma Import (C, Internal, "gtk_range_set_slider_size_fixed");
   begin
      Internal (Get_Object (The_Range), Boolean'Pos (Size_Fixed));
   end Set_Slider_Size_Fixed;

   -----------------------------------
   -- Set_Upper_Stepper_Sensitivity --
   -----------------------------------

   procedure Set_Upper_Stepper_Sensitivity
      (The_Range   : access Gtk_Range_Record;
       Sensitivity : Gtk.Enums.Gtk_Sensitivity_Type)
   is
      procedure Internal (The_Range : System.Address; Sensitivity : Integer);
      pragma Import (C, Internal, "gtk_range_set_upper_stepper_sensitivity");
   begin
      Internal (Get_Object (The_Range), Gtk.Enums.Gtk_Sensitivity_Type'Pos (Sensitivity));
   end Set_Upper_Stepper_Sensitivity;

   ---------------
   -- Set_Value --
   ---------------

   procedure Set_Value
      (The_Range : access Gtk_Range_Record;
       Value     : Gdouble)
   is
      procedure Internal (The_Range : System.Address; Value : Gdouble);
      pragma Import (C, Internal, "gtk_range_set_value");
   begin
      Internal (Get_Object (The_Range), Value);
   end Set_Value;

   ---------------------
   -- Get_Orientation --
   ---------------------

   function Get_Orientation
      (Self : access Gtk_Range_Record) return Gtk.Enums.Gtk_Orientation
   is
      function Internal (Self : System.Address) return Integer;
      pragma Import (C, Internal, "gtk_orientable_get_orientation");
   begin
      return Gtk.Enums.Gtk_Orientation'Val (Internal (Get_Object (Self)));
   end Get_Orientation;

   ---------------------
   -- Set_Orientation --
   ---------------------

   procedure Set_Orientation
      (Self        : access Gtk_Range_Record;
       Orientation : Gtk.Enums.Gtk_Orientation)
   is
      procedure Internal (Self : System.Address; Orientation : Integer);
      pragma Import (C, Internal, "gtk_orientable_set_orientation");
   begin
      Internal (Get_Object (Self), Gtk.Enums.Gtk_Orientation'Pos (Orientation));
   end Set_Orientation;

end Gtk.GRange;
