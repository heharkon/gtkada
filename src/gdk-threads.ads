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

--  <description>
--
--  This package provides simple primitives to write multithreaded applications
--  with GtkAda. See the GtkAda User's Guide for more details (section
--  Tasking with GtkAda).
--
--  </description>
--  <c_version>1.2.7</c_version>

with System;

package Gdk.Threads is

   procedure Init (Vtable : System.Address := System.Null_Address);
   --  Initialize the Gdk internal threading support.
   --  This procedure must be called before any call to Enter or Leave.
   --  The parameter Vtable should never be used for now.

   procedure Enter;
   --  Take the GtkAda global lock.
   --  See the GtkAda User's Guide for more details (section Tasking with
   --  GtkAda).

   procedure Leave;
   --  Release the GtkAda global lock.
   --  See the GtkAda User's Guide for more details (section Tasking with
   --  GtkAda).

private
   pragma Linker_Options ("-lgthread");
   --  This is needed to resolve g_thread_init

   pragma Import (C, Init, "g_thread_init");
   pragma Import (C, Enter, "gdk_threads_enter");
   pragma Import (C, Leave, "gdk_threads_leave");
end Gdk.Threads;
