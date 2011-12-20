------------------------------------------------------------------------------
--                  GtkAda - Ada95 binding for Gtk+/Gnome                   --
--                                                                          --
--                     Copyright (C) 2010-2012, AdaCore                     --
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
--  Gtk_Recent_Chooser_Dialog is a dialog box suitable for displaying the
--  recently used documents. This widgets works by putting a
--  Gtk_Recent_Chooser_Widget inside a Gtk_Dialog. It exposes the
--  Gtk_Recent_Chooser_Iface interface, so you can use all the
--  Gtk_Recent_Chooser functions on the recent chooser dialog as well as those
--  for Gtk_Dialog.
--
--  Note that Gtk_Recent_Chooser_Dialog does not have any methods of its own.
--  Instead, you should use the functions that work on a Gtk_Recent_Chooser.
--  </description>
--  <c_version>2.16.6</c_version>

with Gtk.Dialog;
with Gtk.Recent_Manager;
with Gtk.Window;

package Gtk.Recent_Chooser_Dialog is

   type Gtk_Recent_Chooser_Dialog_Record is
     new Gtk.Dialog.Gtk_Dialog_Record with private;
   type Gtk_Recent_Chooser_Dialog is
     access all Gtk_Recent_Chooser_Dialog_Record'Class;

   function Get_Type return GType;

   procedure Gtk_New
     (Widget : out Gtk_Recent_Chooser_Dialog;
      Title  : String;
      Parent : access Gtk.Window.Gtk_Window_Record'Class);
   procedure Initialize
     (Widget : access Gtk_Recent_Chooser_Dialog_Record'Class;
      Title  : String;
      Parent : access Gtk.Window.Gtk_Window_Record'Class);
   --  Creates a new Gtk_Recent_Chooser_Dialog.
   --  Use Gtk.Dialog.Add_Button to add button/response pairs to this widget.

   procedure Gtk_New_For_Manager
     (Widget  : out Gtk_Recent_Chooser_Dialog;
      Title   : String;
      Parent  : access Gtk.Window.Gtk_Window_Record'Class;
      Manager : access Gtk.Recent_Manager.Gtk_Recent_Manager_Record'Class);
   procedure Initialize_For_Manager
     (Widget  : access Gtk_Recent_Chooser_Dialog_Record'Class;
      Title   : String;
      Parent  : access Gtk.Window.Gtk_Window_Record'Class;
      Manager : access Gtk.Recent_Manager.Gtk_Recent_Manager_Record'Class);
   --  Creates a new Gtk_Recent_Chooser_Dialog with a specified recent manager.
   --  Use Gtk.Dialog.Add_Button to add button/response pairs to this widget.

private

   type Gtk_Recent_Chooser_Dialog_Record is
     new Gtk.Dialog.Gtk_Dialog_Record with null record;

   pragma Import (C, Get_Type, "gtk_recent_chooser_dialog_get_type");

end Gtk.Recent_Chooser_Dialog;
