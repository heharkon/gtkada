------------------------------------------------------------------------------
--                  GtkAda - Ada95 binding for Gtk+/Gnome                   --
--                                                                          --
--                     Copyright (C) 2011-2012, AdaCore                     --
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
--  Utility functions that mimic Gtk.Style drawing methods, but using Cairo
--  instead of Gdk. This allow smooth transition to Gtk3 that will get rid
--  of those Gdk drawing methods and only use Cairo.
--  </description>
--  <group>Configuration and Themes</group>

with Glib;

with Cairo;

with Pango.Layout;

with Gdk.Color;
with Gdk.Pixbuf;

with Gtk.Enums;
with Gtk.Style;

package Gtkada.Style is

   --------------------
   -- Color handling --
   --------------------

   subtype Cairo_Color_Val is Glib.Gdouble range 0.0 .. 1.0;
   --  In cairo, the color components are expressed as percents.

   type Cairo_Color is record
      R, G, B : Cairo_Color_Val;
      Alpha   : Cairo_Color_Val := 1.0;
   end record;

   type HSV_Color is record
      H, S, V, A : Cairo_Color_Val;
   end record;
   --  Used when manipulating Cairo color. The HSV color space is useful when
   --  wanting to shade a color (change it's value), (de)saturate it, or modify
   --  its hue.

   function To_HSV (Color   : Cairo_Color) return HSV_Color;
   function To_Cairo (HSV : HSV_Color) return Cairo_Color;
   function To_Cairo (Color : Gdk.Color.Gdk_Color) return Cairo_Color;
   --  Translations between one color definition to another

   function Shade
     (Color : Gdk.Color.Gdk_Color;
      Value : Glib.Gdouble) return Cairo_Color;
   function Shade
     (Color : Cairo_Color;
      Value : Glib.Gdouble) return Cairo_Color;
   --  Modifies the lightning of the color by the specified value

   procedure Set_Source_Color
     (Cr : Cairo.Cairo_Context; Color : Cairo_Color);

   -----------------------------
   -- Extra path manipulation --
   -----------------------------

   procedure Rounded_Rectangle
     (Cr         : Cairo.Cairo_Context;
      X, Y, W, H : Glib.Gdouble;
      Radius     : Glib.Gdouble);
   --  Draws a rounded rectangle at coordinate X, Y with W and H size.
   --  If Radius > 0, then the corner will be rounded.

   -------------------------
   -- Drawing subprograms --
   -------------------------

   procedure Draw_Shadow
     (Cr                  : Cairo.Cairo_Context;
      Style               : Gtk.Style.Gtk_Style;
      Shadow_Type         : Gtk.Enums.Gtk_Shadow_Type;
      X, Y, Width, Height : Glib.Gint;
      Corner_Radius       : Glib.Gdouble := 0.0);
   --  Draws a Frame of size Width x Height at position (X, Y) and (X2, Y2)
   --  using the specified color.
   --  Corner_Radius allows you to draw a rounded frame if set to a value > 0.
   --
   --  Additional drawing styles can be specified by using Cairo.Set_Line_XXXX
   --  on the Cairo_Context before calling this procedure.

   procedure Draw_Rectangle
     (Cr                  : Cairo.Cairo_Context;
      Color               : Cairo_Color;
      Filled              : Boolean;
      X, Y, Width, Height : Glib.Gint;
      Corner_Radius       : Glib.Gdouble := 0.0);
   procedure Draw_Rectangle
     (Cr                  : Cairo.Cairo_Context;
      Color               : Gdk.Color.Gdk_Color;
      Filled              : Boolean;
      X, Y, Width, Height : Glib.Gint;
      Corner_Radius       : Glib.Gdouble := 0.0);
   --  Draws a rectangle of size Width x Height at position (X, Y) and (X2, Y2)
   --  using the specified color.
   --  Corner_Radius allows you to draw a rounded rectangle if set to a
   --  value > 0.0
   --
   --  Additional drawing styles can be specified by using Cairo.Set_Line_XXXX
   --  on the Cairo_Context before calling this procedure.

   procedure Draw_Line
     (Cr             : Cairo.Cairo_Context;
      Color          : Cairo_Color;
      X1, Y1, X2, Y2 : Glib.Gint);
   procedure Draw_Line
     (Cr             : Cairo.Cairo_Context;
      Color          : Gdk.Color.Gdk_Color;
      X1, Y1, X2, Y2 : Glib.Gint);
   --  Draws a line between (X1, Y1) and (X2, Y2) using the specified color.
   --
   --  Additional drawing styles can be specified by using Cairo.Set_Line_XXXX
   --  on the Cairo_Context before calling this procedure.

   procedure Draw_Layout
     (Cr     : Cairo.Cairo_Context;
      Color  : Cairo_Color;
      X, Y   : Glib.Gint;
      Layout : Pango.Layout.Pango_Layout);
   procedure Draw_Layout
     (Cr     : Cairo.Cairo_Context;
      Color  : Gdk.Color.Gdk_Color;
      X, Y   : Glib.Gint;
      Layout : Pango.Layout.Pango_Layout);
   --  Draws the Pango layout at position (X, Y) using Color.

   procedure Draw_Pixbuf
     (Cr     : Cairo.Cairo_Context;
      Pixbuf : Gdk.Pixbuf.Gdk_Pixbuf;
      X, Y   : Glib.Gint);
   --  Draws a pixbuf at coordinate X, Y
   --
   --  Note that Gdk_Pixmap or Gdk_Bitmap are not supported, as those
   --  are server-side images, so depend on a surface attached to a screen.
   --  As a result, those would not be drawn on a non-screen surface (such as
   --  an internal Image_Surface).

end Gtkada.Style;
