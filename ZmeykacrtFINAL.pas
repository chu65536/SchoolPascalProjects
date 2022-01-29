program zmeyka;

uses crt;

type
  point = record x, y: integer;
  end;

var
  snake: array[1..1000]of point;
  i, j, xhead, yhead, eaty, eatx, flag2, n, score: integer;
  game: boolean;
  flag: char;

begin
  crtwindowsize(61, 27);
  window(1, 1, 61, 27);
  hidecursor;
  textcolor(black);

  eatx := (random(30) + 1) * 2; eaty := random(25) + 3;

  n := 1;

  xhead := 30; yhead := 12;
  gotoxy(xhead, yhead);
  write('O');

  gotoxy(23, 4);
  write('CONTROL "WASD"');

  gotoxy(18, 5);
  write('PRESS ANY BUTTON TO START');

  while game <> true do
    if keypressed then game := true;

  while game do
  begin
    gotoxy(27, 1);
    write('SCORE:', score);
    gotoxy(1, 2);
    write('_____________________________________________________________');

    gotoxy(eatx, eaty);
    textcolor(red);
    write('O');
    textcolor(black);

    if keypressed then flag := readkey;
    if (flag = 'd') and (flag2 = 2) and (n <> 1) then flag := 'a';
    if (flag = 'a') and (flag2 = 1) and (n <> 1) then flag := 'd';
    if (flag = 's') and (flag2 = 3) and (n <> 1) then flag := 'w';
    if (flag = 'w') and (flag2 = 4) and (n <> 1) then flag := 's';

    if n >= 2 then
    begin
      snake[1].x := xhead;
      snake[1].y := yhead;
      gotoxy(snake[1].x, snake[1].y);
      write('0');
    end;

    for i := n downto 2 do
    begin
      snake[i].x := snake[i - 1].x;
      snake[i].y := snake[i - 1].y;
      gotoxy(snake[i].x, snake[i].y);
      write('0');
    end;



    if flag = 'd' then begin xhead := xhead + 2; flag2 := 1; end;
    if flag = 'a' then begin xhead := xhead - 2; flag2 := 2; end;
    if flag = 'w' then begin yhead := yhead - 1; flag2 := 3; end;
    if flag = 's' then begin yhead := yhead + 1; flag2 := 4; end;
    if (xhead > 60) or (xhead < 1) then game := false;
    if(yhead < 3) or (yhead > 27) then game := false;

    gotoxy(xhead, yhead);
    write('O');

    if (xhead = eatx) and (yhead = eaty) then begin
      score := score + 1;
      n := n + 1;
      eatx := (random(30) + 1) * 2; eaty := random(25) + 3;

      for i := n downto 2 do
        if (snake[i].x = eatx) and (snake[i].y = eaty) then repeat
            eatx := (random(30) + 1) * 2; eaty := random(25) + 3;
          until (snake[i].x <> eatx) or (snake[i].y <> eaty);

      gotoxy(eatx, eaty);
      textcolor(red);
      write('O');
      textcolor(black);
    end;

    for i := 3 to n do
      if (xhead = snake[i].x) and (yhead = snake[i].Y) then game := false;

    if n = 750 then game := false;

    delay(100);
    clrscr;
  end;

  if n = 750 then write('YOU WIN');
  if n < 750 then
  begin
    writeln('GAME OVER');
    writeln('YOUR SCORE:', score);
  end;

end.