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

with System;
with Gdk; use Gdk;
with Gtk.Util; use Gtk.Util;

package body Gtk.Notebook is

   -----------------
   -- Append_Page --
   -----------------

   procedure Append_Page
     (Notebook  : access Gtk_Notebook_Record;
      Child     : in Gtk.Widget.Gtk_Widget;
      Tab_Label : in Gtk.Widget.Gtk_Widget)
   is
      procedure Internal
        (Notebook  : in System.Address;
         Child     : in System.Address;
         Tab_Label : in System.Address);
      pragma Import (C, Internal, "gtk_notebook_append_page");

   begin
      Internal (Get_Object (Notebook),
                Get_Object (Child),
                Get_Object (Tab_Label));
   end Append_Page;

   ----------------------
   -- Append_Page_Menu --
   ----------------------

   procedure Append_Page_Menu
     (Notebook   : access Gtk_Notebook_Record;
      Child      : in Gtk.Widget.Gtk_Widget;
      Tab_Label  : in Gtk.Widget.Gtk_Widget;
      Menu_Label : in Gtk.Widget.Gtk_Widget)
   is
      procedure Internal
        (Notebook   : in System.Address;
         Child      : in System.Address;
         Tab_Label  : in System.Address;
         Menu_Label : in System.Address);
      pragma Import (C, Internal, "gtk_notebook_append_page_menu");

   begin
      Internal (Get_Object (Notebook),
                Get_Object (Child),
                Get_Object (Tab_Label),
                Get_Object (Menu_Label));
   end Append_Page_Menu;

   ----------------------
   -- Get_Current_Page --
   ----------------------

   function Get_Current_Page (Notebook : access Gtk_Notebook_Record)
                              return Gint
   is
      function Internal (Notebook : in System.Address) return Gint;
      pragma Import (C, Internal, "gtk_notebook_get_current_page");
   begin
      return Internal (Get_Object (Notebook));
   end Get_Current_Page;

   ------------------
   -- Get_Children --
   ------------------

   function Get_Children (Widget : access Gtk_Notebook_Record)
                          return Widget_List.Glist
   is
      function Internal (Widget : in System.Address) return System.Address;
      pragma Import (C, Internal, "ada_notebook_get_children");
      use Widget_List;
      List : Glist;
   begin
      Set_Object (List, Internal (Get_Object (Widget)));
      return List;
   end Get_Children;

   ------------------
   -- Get_Cur_Page --
   ------------------

   function Get_Cur_Page (Widget : access Gtk_Notebook_Record)
                          return Gtk_Notebook_Page
   is
      function Internal (Widget : in System.Address) return System.Address;
      pragma Import (C, Internal, "ada_notebook_get_cur_page");
      Stub : Gtk_Notebook_Page_Record;
   begin
      return Gtk_Notebook_Page
        (Get_User_Data (Internal (Get_Object (Widget)), Stub));
   end Get_Cur_Page;

   --------------------
   -- Get_Menu_Label --
   --------------------

   function Get_Menu_Label (Page : access Gtk_Notebook_Page_Record)
     return Gtk.Widget.Gtk_Widget
   is
      function Internal (Widget : in System.Address) return System.Address;
      pragma Import (C, Internal, "ada_notebook_get_menu_label");
      Stub : Gtk.Widget.Gtk_Widget_Record;
   begin
      return Gtk.Widget.Gtk_Widget
        (Get_User_Data (Internal (Get_Object (Page)), Stub));
   end Get_Menu_Label;

   -------------------
   -- Get_Tab_Label --
   -------------------

   function Get_Tab_Label (Page : access Gtk_Notebook_Page_Record)
     return Gtk.Widget.Gtk_Widget
   is
      function Internal (Widget : in System.Address) return System.Address;
      pragma Import (C, Internal, "ada_notebook_get_tab_label");
      Stub : Gtk.Widget.Gtk_Widget_Record;
   begin
      return Gtk.Widget.Gtk_Widget
        (Get_User_Data (Internal (Get_Object (Page)), Stub));
   end Get_Tab_Label;

   -----------------
   -- Get_Tab_Pos --
   -----------------

   function Get_Tab_Pos (Widget : access Gtk_Notebook_Record)
                         return Gtk_Position_Type
   is
      function Internal (Widget : in System.Address) return Gint;
      pragma Import (C, Internal, "ada_notebook_get_tab_pos");
   begin
      return Gtk_Position_Type'Val (Internal (Get_Object (Widget)));
   end Get_Tab_Pos;

   -------------
   -- Gtk_New --
   -------------

   procedure Gtk_New (Widget : out Gtk_Notebook) is
   begin
      Widget := new Gtk_Notebook_Record;
      Initialize (Widget);
   end Gtk_New;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (Widget : access Gtk_Notebook_Record) is
      function Internal return System.Address;
      pragma Import (C, Internal, "gtk_notebook_new");
   begin
      Set_Object (Widget, Internal);
      Initialize_User_Data (Widget);
   end Initialize;

   -----------------
   -- Insert_Page --
   -----------------

   procedure Insert_Page
     (Notebook  : access Gtk_Notebook_Record;
      Child     : in Gtk.Widget.Gtk_Widget;
      Tab_Label : in Gtk.Widget.Gtk_Widget;
      Position  : in Gint)
   is
      procedure Internal
        (Notebook  : in System.Address;
         Child     : in System.Address;
         Tab_Label : in System.Address;
         Position  : in Gint);
      pragma Import (C, Internal, "gtk_notebook_insert_page");

   begin
      Internal (Get_Object (Notebook),
                Get_Object (Child),
                Get_Object (Tab_Label),
                Position);
   end Insert_Page;

   ----------------------
   -- Insert_Page_Menu --
   ----------------------

   procedure Insert_Page_Menu
     (Notebook   : access Gtk_Notebook_Record;
      Child      : in Gtk.Widget.Gtk_Widget;
      Tab_Label  : in Gtk.Widget.Gtk_Widget;
      Menu_Label : in Gtk.Widget.Gtk_Widget;
      Position   : in Gint)
   is
      procedure Internal
        (Notebook   : in System.Address;
         Child      : in System.Address;
         Tab_Label  : in System.Address;
         Menu_Label : in System.Address;
         Position   : in Gint);
      pragma Import (C, Internal, "gtk_notebook_insert_page_menu");

   begin
      Internal (Get_Object (Notebook),
                Get_Object (Child),
                Get_Object (Tab_Label),
                Get_Object (Menu_Label),
                Position);
   end Insert_Page_Menu;

   ---------------
   -- Next_Page --
   ---------------

   procedure Next_Page (Notebook : access Gtk_Notebook_Record) is
      procedure Internal (Notebook : in System.Address);
      pragma Import (C, Internal, "gtk_notebook_next_page");
   begin
      Internal (Get_Object (Notebook));
   end Next_Page;

   -------------------
   -- Popup_Disable --
   -------------------

   procedure Popup_Disable (Notebook : access Gtk_Notebook_Record) is
      procedure Internal (Notebook : in System.Address);
      pragma Import (C, Internal, "gtk_notebook_popup_disable");
   begin
      Internal (Get_Object (Notebook));
   end Popup_Disable;

   ------------------
   -- Popup_Enable --
   ------------------

   procedure Popup_Enable (Notebook : access Gtk_Notebook_Record) is
      procedure Internal (Notebook : in System.Address);
      pragma Import (C, Internal, "gtk_notebook_popup_enable");
   begin
      Internal (Get_Object (Notebook));
   end Popup_Enable;

   ------------------
   -- Prepend_Page --
   ------------------

   procedure Prepend_Page
     (Notebook  : access Gtk_Notebook_Record;
      Child     : in Gtk.Widget.Gtk_Widget;
      Tab_Label : in Gtk.Widget.Gtk_Widget)
   is
      procedure Internal
        (Notebook  : in System.Address;
         Child     : in System.Address;
         Tab_Label : in System.Address);
      pragma Import (C, Internal, "gtk_notebook_prepend_page");

   begin
      Internal (Get_Object (Notebook),
                Get_Object (Child),
                Get_Object (Tab_Label));
   end Prepend_Page;

   -----------------------
   -- Prepend_Page_Menu --
   -----------------------

   procedure Prepend_Page_Menu
     (Notebook   : access Gtk_Notebook_Record;
      Child      : in Gtk.Widget.Gtk_Widget;
      Tab_Label  : in Gtk.Widget.Gtk_Widget;
      Menu_Label : in Gtk.Widget.Gtk_Widget)
   is
      procedure Internal
        (Notebook   : in System.Address;
         Child      : in System.Address;
         Tab_Label  : in System.Address;
         Menu_Label : in System.Address);
      pragma Import (C, Internal, "gtk_notebook_prepend_page_menu");
   begin
      Internal (Get_Object (Notebook),
                Get_Object (Child),
                Get_Object (Tab_Label),
                Get_Object (Menu_Label));
   end Prepend_Page_Menu;

   ---------------
   -- Prev_Page --
   ---------------

   procedure Prev_Page (Notebook : in out Gtk_Notebook) is
      procedure Internal (Notebook : in System.Address);
      pragma Import (C, Internal, "gtk_notebook_prev_page");
   begin
      Internal (Get_Object (Notebook));
   end Prev_Page;

   -----------------
   -- Remove_Page --
   -----------------

   procedure Remove_Page (Notebook : access Gtk_Notebook_Record;
                          Page_Num : in Gint)
   is
      procedure Internal (Notebook : in System.Address; Page_Num : in Gint);
      pragma Import (C, Internal, "gtk_notebook_remove_page");
   begin
      Internal (Get_Object (Notebook), Page_Num);
   end Remove_Page;

   --------------
   -- Set_Page --
   --------------

   procedure Set_Page (Notebook : access Gtk_Notebook_Record;
                       Page_Num : in Gint)
   is
      procedure Internal (Notebook : in System.Address; Page_Num : in Gint);
      pragma Import (C, Internal, "gtk_notebook_set_page");
   begin
      Internal (Get_Object (Notebook), Page_Num);
   end Set_Page;

   --------------------
   -- Set_Scrollable --
   --------------------

   procedure Set_Scrollable (Notebook : access Gtk_Notebook_Record;
                             Scrollable : Boolean)
   is
      procedure Internal (Notebook : in System.Address; Scrollable : in Gint);
      pragma Import (C, Internal, "gtk_notebook_set_scrollable");
   begin
      Internal (Get_Object (Notebook), Boolean'Pos (Scrollable));
   end Set_Scrollable;

   ---------------------
   -- Set_Show_Border --
   ---------------------

   procedure Set_Show_Border (Notebook : access Gtk_Notebook_Record;
                              Show_Border : Boolean)
   is
      procedure Internal (Notebook    : in System.Address;
                          Show_Border : in Gint);
      pragma Import (C, Internal, "gtk_notebook_set_show_border");
   begin
      Internal (Get_Object (Notebook), Boolean'Pos (Show_Border));
   end Set_Show_Border;

   -------------------
   -- Set_Show_Tabs --
   -------------------

   procedure Set_Show_Tabs (Notebook : access Gtk_Notebook_Record;
                            Show_Tabs : Boolean)
   is
      procedure Internal (Notebook : in System.Address; Show_Tabs : in Gint);
      pragma Import (C, Internal, "gtk_notebook_set_show_tabs");
   begin
      Internal (Get_Object (Notebook), Boolean'Pos (Show_Tabs));
   end Set_Show_Tabs;

   -------------
   -- Set_Tab --
   -------------

   procedure Set_Tab (Notebook  : access Gtk_Notebook_Record;
                      Page_Num  : in Gint;
                      Tab_Label : in Gtk.Widget.Gtk_Widget) is
      Notebook_Page : Gtk_Notebook_Page;

      function Internal (Notebook_Page : in System.Address)
        return System.Address;
      pragma Import (C, Internal, "ada_notebook_page_get_child");
      Stub : Gtk_Notebook_Page_Record;
   begin
      Notebook_Page := Gtk_Notebook_Page
        (Get_User_Data (Internal (Get_Object (Widget_List.Nth_Data
                                              (Get_Children (Notebook),
                                               Guint (Page_Num)))), Stub));
      Ref (Gtk_Object (Notebook_Page));
      Remove_Page (Notebook, Page_Num);
      Insert_Page (Notebook, Gtk_Widget (Notebook_Page), Tab_Label, Page_Num);
      Unref (Gtk_Object (Notebook_Page));
   end Set_Tab;

   --------------------
   -- Set_Tab_Border --
   --------------------

   procedure Set_Tab_Border (Notebook : access Gtk_Notebook_Record;
                             Border_Width : Gint)
   is
      procedure Internal (Notebook : System.Address; Border_Width : Gint);
      pragma Import (C, Internal, "gtk_notebook_set_tab_border");
   begin
      Internal (Get_Object (Notebook), Border_Width);
   end Set_Tab_Border;

   -----------------
   -- Set_Tab_Pos --
   -----------------

   procedure Set_Tab_Pos (Notebook : access Gtk_Notebook_Record;
                          Pos : Gtk_Position_Type)
   is
      procedure Internal (Notebook : in System.Address; Pos : in Gint);
      pragma Import (C, Internal, "gtk_notebook_set_tab_pos");
   begin
      Internal (Get_Object (Notebook), Gtk_Position_Type'Pos (Pos));
   end Set_Tab_Pos;

   --------------
   -- Generate --
   --------------

   procedure Generate (Notebook : access Gtk_Notebook_Record;
                       N        : in Node_Ptr;
                       File     : in File_Type) is
      use Container;
   begin
      Gen_New (N, "Notebook", File => File);
      Generate (Gtk_Container (Notebook), N, File);
      Gen_Set (N, "Notebook", "scrollable", File);
      Gen_Set (N, "Notebook", "show_border", File);
      Gen_Set (N, "Notebook", "show_tabs", File);
      Gen_Set (N, "Notebook", "tab_border", File);
      Gen_Set (N, "Notebook", "tab_pos", File);
   end Generate;

   procedure Generate (Notebook : access Gtk_Notebook_Record;
                       N        : in Node_Ptr) is
      use Container;

--         S : String_Ptr;
   begin
--         if not N.Specific_Data.Created then
--            Gtk_New (Notebook);
--            Set_Object (Get_Field (N, "name"), Notebook'Unchecked_Access);
--            N.Specific_Data.Created := True;
--         end if;

--         Generate (Gtk_Container (Notebook), N);

--         S := Get_Field (N, "scrollable");

--         if S /= null then
--            Set_Scrollable (Notebook, Boolean'Value (S.all));
--         end if;

--         S := Get_Field (N, "show_border");

--         if S /= null then
--            Set_Show_Border (Notebook, Boolean'Value (S.all));
--         end if;

--         S := Get_Field (N, "show_tabs");

--         if S /= null then
--            Set_Show_Tabs (Notebook, Boolean'Value (S.all));
--         end if;

--         S := Get_Field (N, "tab_border");

--         if S /= null then
--            Set_Tab_Border (Notebook, Gint'Value (S.all));
--         end if;

--         S := Get_Field (N, "tab_pos");

--         if S /= null then
--            Set_Tab_Pos
--              (Notebook,
--               Gtk_Position_Type'Value (S (S'First + 4 .. S'Last)));
--         end if;
      null;
   end Generate;

end Gtk.Notebook;
