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
with Gtk.Adjustment;
with System;

package body Gtk.Progress_Bar is

   -------------
   -- Gtk_New --
   -------------

   procedure Gtk_New (Widget     : out Gtk_Progress_Bar;
                      Adjustment : in Gtk.Adjustment.Gtk_Adjustment := null)
   is
   begin
      Widget := new Gtk_Progress_Bar_Record;
      Initialize (Widget, Adjustment);
   end Gtk_New;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (Widget     : access Gtk_Progress_Bar_Record;
                         Adjustment : in Gtk.Adjustment.Gtk_Adjustment)
   is
      function Internal (Adjustment : in System.Address)
                         return          System.Address;
      pragma Import (C, Internal, "gtk_progress_bar_new_with_adjustment");
   begin
      Set_Object (Widget, Internal (Get_Object (Adjustment)));
      Initialize_User_Data (Widget);
   end Initialize;

   -------------------------
   -- Set_Activity_Blocks --
   -------------------------

   procedure Set_Activity_Blocks
      (Pbar   : access Gtk_Progress_Bar_Record;
       Blocks : in Guint)
   is
      procedure Internal
         (Pbar   : in System.Address;
          Blocks : in Guint);
      pragma Import (C, Internal, "gtk_progress_bar_set_activity_blocks");
   begin
      Internal (Get_Object (Pbar),
                Blocks);
   end Set_Activity_Blocks;

   -----------------------
   -- Set_Activity_Step --
   -----------------------

   procedure Set_Activity_Step
      (Pbar : access Gtk_Progress_Bar_Record;
       Step : in Guint)
   is
      procedure Internal
         (Pbar : in System.Address;
          Step : in Guint);
      pragma Import (C, Internal, "gtk_progress_bar_set_activity_step");
   begin
      Internal (Get_Object (Pbar),
                Step);
   end Set_Activity_Step;

   -------------------
   -- Set_Bar_Style --
   -------------------

   procedure Set_Bar_Style
      (Pbar  : access Gtk_Progress_Bar_Record;
       Style : in Gtk_Progress_Bar_Style)
   is
      procedure Internal
         (Pbar  : in System.Address;
          Style : in Gint);
      pragma Import (C, Internal, "gtk_progress_bar_set_bar_style");
   begin
      Internal (Get_Object (Pbar),
                Gtk_Progress_Bar_Style'Pos (Style));
   end Set_Bar_Style;

   -------------------------
   -- Set_Discrete_Blocks --
   -------------------------

   procedure Set_Discrete_Blocks
      (Pbar   : access Gtk_Progress_Bar_Record;
       Blocks : in Guint)
   is
      procedure Internal
         (Pbar   : in System.Address;
          Blocks : in Guint);
      pragma Import (C, Internal, "gtk_progress_bar_set_discrete_blocks");
   begin
      Internal (Get_Object (Pbar),
                Blocks);
   end Set_Discrete_Blocks;

   ---------------------
   -- Set_Orientation --
   ---------------------

   procedure Set_Orientation
      (Pbar        : access Gtk_Progress_Bar_Record;
       Orientation : in Gtk_Progress_Bar_Orientation)
   is
      procedure Internal
         (Pbar        : in System.Address;
          Orientation : in Gint);
      pragma Import (C, Internal, "gtk_progress_bar_set_orientation");
   begin
      Internal (Get_Object (Pbar),
                Gtk_Progress_Bar_Orientation'Pos (Orientation));
   end Set_Orientation;

   ------------
   -- Update --
   ------------

   procedure Update
      (Pbar       : access Gtk_Progress_Bar_Record;
       Percentage : in Gfloat)
   is
      procedure Internal
         (Pbar       : in System.Address;
          Percentage : in Gfloat);
      pragma Import (C, Internal, "gtk_progress_bar_update");
   begin
      Internal (Get_Object (Pbar),
                Percentage);
   end Update;

end Gtk.Progress_Bar;
