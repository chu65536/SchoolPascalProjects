program chess;

uses crt;

type
  point = record x, y: integer; end;

var
  i, j, x, y, n, y1, x2, y2, y3, x3, s1, s2, r, flag: integer;
  choose, restart: boolean;
  key, x1: char;
  desk: array[1..8, 1..8]of point;

begin
  crtwindowsize(22, 13);
  hidecursor;

  while true do
  begin

    y := 8; s1 := 1; s2 := 1;

    choose := true;
    while choose do
    begin
      gotoxy(5, 1);
      writeln('CHOOSE FIGURE');

      gotoxy(8, 4);
      writeln('KING');
      gotoxy(8, 5);
      writeln('QUEEN');
      gotoxy(8, 6);
      writeln('BISHOP');
      gotoxy(8, 7);
      writeln('ROOK');
      gotoxy(8, 8);
      writeln('KNIGHT');

      if keypressed then key := readkey;
      if (key = 'w') and (y <> 4) then begin y := y - 1; key := 'q'; end;
      if (key = 's') and (y <> 8) then begin y := y + 1; key := 'q'; end;
      if key = #13 then choose := false;

      gotoxy(14, y);
      writeln('<<<');

      delay(100);
      clrscr;

    end;

    writeln('  ENTER  COORDINATES');

    for i := 1 to 8 do
    begin
      gotoxy(4, i + 2);

      for j := 1 to 8 do
      begin
        desk[i, j].x := s1;
        desk[i, j].y := s2;
        if (i + j) mod 2 = 1 then textbackground(black)
        else textbackground(LightGray);
        write('  ');
        s1 := s1 + 1;
      end;

      s2 := s2 + 1;
      writeln;
      s1 := 1;
    end;

    n := 65;
    textbackground(white);
    gotoxy(4, 11);
    for i := 1 to 8 do
    begin
      write(chr(n), ' ');
      n := n + 1;
    end;

    for i := 1 to 8 do
    begin
      gotoxy(2, 8 - i + 3);
      writeln(i);
    end;

    gotoxy(9, 13);
    readln(x1, y1);

    x := (ord(x1) - 64) * 2;

    x3 := ord(x1) - 64; y3 := 9 - y1;

    x2 := 2 + x; y2 := 11 - y1;

    while (x3 > 8) or (y3 > 8) or (y3 < 1) or (x3 < 1) do
    begin
      gotoxy(2, 1);
      writeln('REENTER  COORDINATES');

      gotoxy(9, 13);
      write('                  ');

      gotoxy(9, 13);
      readln(x1, y1);


      x := (ord(x1) - 64) * 2;

      x3 := ord(x1) - 64; y3 := 9 - y1;

      x2 := 2 + x; y2 := 11 - y1;
    end;

    textbackground(red);
    if y = 8 then for i := 1 to 8 do
      begin
        gotoxy(4, i + 2);

        for j := 1 to 8 do
        begin
          if ((desk[i, j].y = y3 - 2) and ((desk[i, j].x = x3 - 1) or (desk[i, j].x = x3 + 1))) or ((desk[i, j].y = y3 + 2) and ((desk[i, j].x = x3 - 1) or (desk[i, j].x = x3 + 1))) or ((desk[i, j].y = y3 + 1) and ((desk[i, j].x = x3 - 2) or (desk[i, j].x = x3 + 2))) or ((desk[i, j].y = y3 - 1) and ((desk[i, j].x = x3 - 2) or (desk[i, j].x = x3 + 2))) then textbackground(red)
          else if (i + j) mod 2 = 1 then textbackground(black)
          else textbackground(LightGray);
          write('  ');
        end;

        writeln;
      end;

    if y = 7 then for i := 1 to 8 do
      begin
        gotoxy(4, i + 2);

        for j := 1 to 8 do
        begin
          if (desk[i, j].x = x3) or (desk[i, j].y = y3) then textbackground(red)
          else if (i + j) mod 2 = 1 then textbackground(black)
          else textbackground(LightGray);
          write('  ');
        end;

        writeln;
      end;

    if y = 6 then for i := 1 to 8 do
      begin
        gotoxy(4, i + 2);

        for j := 1 to 8 do
        begin

          for r := 1 to 8 do

            if ((desk[i, j].x + r = x3) and (desk[i, j].y + r = y3)) or ((desk[i, j].x - r = x3) and (desk[i, j].y + r = y3)) or ((desk[i, j].x + r = x3) and (desk[i, j].y - r = y3)) or ((desk[i, j].x - r = x3) and (desk[i, j].y - r = y3)) then begin textbackground(red); flag := 1; end;

          if (flag <> 1) and ((i + j) mod 2 = 1) then textbackground(black);
          if (flag <> 1) and ((i + j) mod 2 = 0) then textbackground(LightGray);
          write('  ');
          flag := 0;
        end;

        writeln;
      end;

    if y = 5 then for i := 1 to 8 do
      begin
        gotoxy(4, i + 2);

        for j := 1 to 8 do
        begin

          for r := 1 to 8 do

            if ((desk[i, j].x + r = x3) and (desk[i, j].y + r = y3)) or ((desk[i, j].x - r = x3) and (desk[i, j].y + r = y3)) or ((desk[i, j].x + r = x3) and (desk[i, j].y - r = y3)) or ((desk[i, j].x - r = x3) and (desk[i, j].y - r = y3)) then begin textbackground(red); flag := 1; end;
          if (desk[i, j].x = x3) or (desk[i, j].y = y3) then begin textbackground(red); flag := 1; end;

          if (flag <> 1) and ((i + j) mod 2 = 1) then textbackground(black);
          if (flag <> 1) and ((i + j) mod 2 = 0) then textbackground(LightGray);
          write('  ');
          flag := 0;
        end;

        writeln;
      end;

    if y = 4 then for i := 1 to 8 do
      begin
        gotoxy(4, i + 2);

        for j := 1 to 8 do
        begin
          if (desk[i, j].x + 1 = x3) and (desk[i, j].y + 1 = y3) or (desk[i, j].x - 1 = x3) and (desk[i, j].y + 1 = y3) or (desk[i, j].x + 1 = x3) and (desk[i, j].y - 1 = y3) or (desk[i, j].x - 1 = x3) and (desk[i, j].y - 1 = y3) or (desk[i, j].x = x3) and (desk[i, j].y + 1 = y3) or (desk[i, j].x = x3) and (desk[i, j].y - 1 = y3) or (desk[i, j].x + 1 = x3) and (desk[i, j].y = y3) or (desk[i, j].x - 1 = x3) and (desk[i, j].y = y3) then textbackground(red)
          else if (i + j) mod 2 = 1 then textbackground(black)
          else textbackground(LightGray);
          write('  ');
        end;

        writeln;
      end;

    gotoxy(x2, y2);
    textbackground(cyan);
    write('  ');

    textbackground(white);
    gotoxy(1, 1);
    writeln('    CYAN - FIGURE    ');
    gotoxy(2, 2);
    writeln('RED - POSSIBLE MOVES');

    gotoxy(2, 13);
    writeln('PRESS "r" TO RESTART');

    restart := true;
    while restart do
    begin
      if keypressed then key := readkey;
      if key = 'r' then restart := false;
    end;

  end;
end.

