
with Interfaces.C.Strings;

package Xpm is

   package ICS renames Interfaces.C.Strings;

   Select_Xpm : ICS.chars_ptr_array :=
     (ICS.New_String ("20 20 3 1"),
      ICS.New_String (".        c None"),
      ICS.New_String ("@  c #FFFFFF"),
      ICS.New_String ("#        c #000000"),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("......#............."),
      ICS.New_String ("......##............"),
      ICS.New_String ("......#@#..........."),
      ICS.New_String ("......#@@#.........."),
      ICS.New_String ("......#@@@#........."),
      ICS.New_String ("......#@@@@#........"),
      ICS.New_String ("......#@@@@@#......."),
      ICS.New_String ("......#@@@@@@#......"),
      ICS.New_String ("......#@@@@@@@#....."),
      ICS.New_String ("......#@@@@@##......"),
      ICS.New_String ("......#@@@@#........"),
      ICS.New_String ("......#@##@@#......."),
      ICS.New_String ("......##..#@#......."),
      ICS.New_String ("..........#@@#......"),
      ICS.New_String ("...........#@#......"),
      ICS.New_String ("...........###......"),
      ICS.New_String ("...................."));

   Rotate_Xpm : ICS.chars_ptr_array :=
     (ICS.New_String ("20 20 5 1"),
      ICS.New_String (".        c None"),
      ICS.New_String ("+        c #000080"),
      ICS.New_String ("@        c #808080"),
      ICS.New_String ("#        c #008000"),
      ICS.New_String ("$        c #FFFFFF"),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("........+..........."),
      ICS.New_String ("........++.........."),
      ICS.New_String ("......@++++........."),
      ICS.New_String (".....++++++........."),
      ICS.New_String ("....+++.++...+@....."),
      ICS.New_String ("...@++..+..........."),
      ICS.New_String ("...++@........++...."),
      ICS.New_String ("...++....##........."),
      ICS.New_String ("...++...####..++...."),
      ICS.New_String ("...++...####..++...."),
      ICS.New_String ("...++....##..@++...."),
      ICS.New_String ("...@++.......++@...."),
      ICS.New_String ("....+++.....+++....."),
      ICS.New_String (".....+++++++++......"),
      ICS.New_String ("......@+++++@......."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."));

   Text_Xpm : ICS.chars_ptr_array :=
     (ICS.New_String ("20 20 4 1"),
      ICS.New_String (".        c None"),
      ICS.New_String ("+        c #000080"),
      ICS.New_String ("@        c #808080"),
      ICS.New_String ("#        c #FFFFFF"),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("..........+........."),
      ICS.New_String (".........@+@........"),
      ICS.New_String (".........+++........"),
      ICS.New_String ("........@+++@......."),
      ICS.New_String ("........++.++......."),
      ICS.New_String (".......@+..++@......"),
      ICS.New_String (".......+++++++......"),
      ICS.New_String ("......@+....++@....."),
      ICS.New_String ("......++....@++....."),
      ICS.New_String (".....@+.....@++@...."),
      ICS.New_String ("....++++...++++++..."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."));

   Line_Xpm : ICS.chars_ptr_array :=
     (ICS.New_String ("20 20 3 1"),
      ICS.New_String (".        c None"),
      ICS.New_String ("+        c #000000"),
      ICS.New_String ("@        c #FFFFFF"),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...+................"),
      ICS.New_String ("....+..............."),
      ICS.New_String (".....+.............."),
      ICS.New_String ("......+............."),
      ICS.New_String (".......+............"),
      ICS.New_String ("........+..........."),
      ICS.New_String (".........+.........."),
      ICS.New_String ("..........+........."),
      ICS.New_String ("...........+........"),
      ICS.New_String ("............+......."),
      ICS.New_String (".............+......"),
      ICS.New_String ("..............+....."),
      ICS.New_String ("...............+...."),
      ICS.New_String ("................+..."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."));

   Ellipse_Xpm : ICS.chars_ptr_array :=
     (ICS.New_String ("20 20 4 1"),
      ICS.New_String (".        c None"),
      ICS.New_String ("+        c #808080"),
      ICS.New_String ("@        c #000000"),
      ICS.New_String ("#        c #FFFFFF"),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("......+@@@@@@+......"),
      ICS.New_String ("....+@@......@@+...."),
      ICS.New_String ("...+@..........@+..."),
      ICS.New_String ("...@............@..."),
      ICS.New_String ("..@..............@.."),
      ICS.New_String ("..@..............@.."),
      ICS.New_String ("..@..............@.."),
      ICS.New_String ("..@..............@.."),
      ICS.New_String ("...@............@..."),
      ICS.New_String ("...+@..........@+..."),
      ICS.New_String ("....+@@......@@+...."),
      ICS.New_String ("......+@@@@@@+......"),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."));

   Circle_Xpm : ICS.chars_ptr_array :=
     (ICS.New_String ("20 20 4 1"),
      ICS.New_String (".        c None"),
      ICS.New_String ("+        c #808080"),
      ICS.New_String ("@        c #000000"),
      ICS.New_String ("#        c #FFFFFF"),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("......+@@@@@@+......"),
      ICS.New_String ("....+@@......@@+...."),
      ICS.New_String ("...+@........@.@+..."),
      ICS.New_String ("...@........@...@..."),
      ICS.New_String ("..@........@.....@.."),
      ICS.New_String ("..@.......@......@.."),
      ICS.New_String ("..@......@.......@.."),
      ICS.New_String ("..@..............@.."),
      ICS.New_String ("...@............@..."),
      ICS.New_String ("...+@..........@+..."),
      ICS.New_String ("....+@@......@@+...."),
      ICS.New_String ("......+@@@@@@+......"),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."));

   Rectangle_Xpm : ICS.chars_ptr_array :=
     (ICS.New_String ("20 20 3 1"),
      ICS.New_String (".        c None"),
      ICS.New_String ("+        c #000000"),
      ICS.New_String ("@        c #FFFFFF"),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("..++++++++++++++++.."),
      ICS.New_String ("..+..............+.."),
      ICS.New_String ("..+..............+.."),
      ICS.New_String ("..+..............+.."),
      ICS.New_String ("..+..............+.."),
      ICS.New_String ("..+..............+.."),
      ICS.New_String ("..+..............+.."),
      ICS.New_String ("..+..............+.."),
      ICS.New_String ("..+..............+.."),
      ICS.New_String ("..+..............+.."),
      ICS.New_String ("..+..............+.."),
      ICS.New_String ("..+..............+.."),
      ICS.New_String ("..+..............+.."),
      ICS.New_String ("..++++++++++++++++.."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."),
      ICS.New_String ("...................."));

end Xpm;
