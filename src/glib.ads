with Interfaces.C;

package Glib is

   package C renames Interfaces.C;
   use type C.int;
   use type C.unsigned;

   ----------------------------------------
   --  The basic types  defined by glib  --
   ----------------------------------------

   type Gshort is new C.short;
   type Glong  is new C.long;
   type Gint   is new C.int;
   type Gchar  is new C.char;

   type Gushort is new C.unsigned_short;
   type Gulong  is new C.unsigned_long;
   type Guint   is new C.unsigned;
   type Guchar  is new C.unsigned_char;

   type Gfloat  is new C.C_float;
   type Gdouble is new C.double;

   subtype Gint8  is Gint range -(2 ** 4) .. (2 ** 4 - 1);
   subtype Gint16 is Gint range -(2 ** 8) .. (2 ** 8 - 1);
   subtype Gint32 is Gint range -(2 ** 16) .. (2 ** 16 - 1);

   subtype Guint8  is Guint range Guint'First .. (2 ** 8 - 1);
   subtype Guint16 is Guint range Guint'First .. (2 ** 16 - 1);
   subtype Guint32 is Guint range Guint'First .. (2 ** 32 - 1);


   ------------------------
   --  Some Array types  --
   ------------------------

   type Gint_Array is array (Natural range <>) of Gint;
   type Gulong_Array is array (Natural range <>) of Gulong;
   type Gfloat_Array is array (Natural range <>) of Gfloat;
   type Guchar_Array is array (Natural range <>) of Guchar;

   ---------------------------
   --  Conversion services  --
   ---------------------------

   function To_Boolean (Value : in Gint) return Boolean;
   function To_Boolean (Value : in Guint) return Boolean;
   function To_Gint (Bool : in Boolean) return Gint;

end Glib;






