program tetris;

uses crt;

type
  point = record x, y, z: integer; end;

var
  z, k, j, i, r, c1, c2, s, iy, t1, t2, flagi, score, z1, flagcolor, color, z2,count,r1, flagspace, rotateback: integer;
  figure: array[1..1000, 1..4]of point;
  game, flagch, flagf, flagmove: boolean;
  key: char;

procedure ramka;
var
  i: integer;
begin
  
  for i := 1 to 20 do
  begin
    gotoxy(1, i);
    write('|');
    gotoxy(22, i);
    write('|');
  end;
  
end;


procedure randomfigure(var x, y: integer);
begin
  x := y;
  y := random(7) + 1;
  flagch := false;
end;

procedure FigureI;
begin
  
  figure[k, 1].x := 8;
  figure[k, 2].x := 10;
  figure[k, 3].x := 12;
  figure[k, 4].x := 14;
  
  figure[k, 1].y := 1;
  figure[k, 2].y := 1;
  figure[k, 3].y := 1;
  figure[k, 4].y := 1;
  
  flagi := 0;
  flagf := false;
end;



procedure FigureJ;
begin
  
  figure[k, 1].x := 8;
  figure[k, 2].x := 8;
  figure[k, 3].x := 10;
  figure[k, 4].x := 12;
  
  figure[k, 1].y := 1;
  figure[k, 2].y := 2;
  figure[k, 3].y := 2;
  figure[k, 4].y := 2;
  
  flagi := 0;
  flagf := false;
end;



procedure FigureL;
begin
  
  figure[k, 1].x := 12;
  figure[k, 2].x := 12;
  figure[k, 3].x := 10;
  figure[k, 4].x := 8;
  
  figure[k, 1].y := 1;
  figure[k, 2].y := 2;
  figure[k, 3].y := 2;
  figure[k, 4].y := 2;
  
  flagi := 0;
  flagf := false;
end;




procedure FigureO;
begin
  
  figure[k, 1].x := 10;
  figure[k, 2].x := 12;
  figure[k, 3].x := 10;
  figure[k, 4].x := 12;
  
  figure[k, 1].y := 1;
  figure[k, 2].y := 1;
  figure[k, 3].y := 2;
  figure[k, 4].y := 2;
  
  flagi := 0;
  flagf := false;
end;


procedure FigureS;
begin
  
  figure[k, 1].x := 12;
  figure[k, 2].x := 10;
  figure[k, 3].x := 10;
  figure[k, 4].x := 8;
  
  figure[k, 1].y := 1;
  figure[k, 2].y := 1;
  figure[k, 3].y := 2;
  figure[k, 4].y := 2;
  
  flagi := 0;
  flagf := false;
end;



procedure FigureT;
begin
  
  figure[k, 1].x := 10;
  figure[k, 2].x := 8;
  figure[k, 3].x := 10;
  figure[k, 4].x := 12;
  
  figure[k, 1].y := 1;
  figure[k, 2].y := 2;
  figure[k, 3].y := 2;
  figure[k, 4].y := 2;
  
  flagi := 0;
  flagf := false;
end;



procedure FigureZ;
begin
  
  figure[k, 1].x := 8;
  figure[k, 2].x := 10;
  figure[k, 3].x := 10;
  figure[k, 4].x := 12;
  
  figure[k, 1].y := 1;
  figure[k, 2].y := 1;
  figure[k, 3].y := 2;
  figure[k, 4].y := 2;
  
  flagi := 0;
  flagf := false;
end;


procedure moveright;
var
  i, j, j1, r, r1: integer;
begin
  
  flagmove := true;
  
  for i := 1 to k - 1 do
    
    for j := 1 to 4 do
      
      for r := 1 to 4 do
      begin
        c2 := i;
        if figure[k, j].x + 2 = figure[i, r].x then if figure[k, j].y  = figure[i, r].y then flagmove:=false;
        
      end;
  
  
  for i := 1 to 4 do
    if figure[k, i].x + 2 > 20 then flagmove := false;
  
  if flagmove then for i := 1 to 4 do
      figure[k, i].x := figure[k, i].x + 2;
  
  key := 'q';
end;



procedure moveleft;
var
  i, j, j1, r1, r: integer;
begin
  
  flagmove := true;
  
  for i := 1 to k - 1 do
    
    for j := 1 to 4 do
      
      for r := 1 to 4 do
      begin
        c2 := i;
        if figure[k, j].x - 2 = figure[i, r].x then if figure[k, j].y  = figure[i, r].y then flagmove:=false;
        
      end;
  
  
  for i := 1 to 4 do
    if figure[k, i].x - 2 < 2 then flagmove := false;
  
  if flagmove then for i := 1 to 4 do
      figure[k, i].x := figure[k, i].x - 2;
  
  key := 'q';
end;




procedure rotateI(var flagi: integer);
var
  flagstop: integer;
begin
  flagstop := 0;
  
  if (flagi = 0) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x + 2;
    figure[k, 3].x := figure[k, 3].x - 2;
    figure[k, 4].x := figure[k, 4].x - 4;
    
    figure[k, 1].y := figure[k, 1].y - 2;
    figure[k, 2].y := figure[k, 2].y - 1;
    figure[k, 4].y := figure[k, 4].y + 1;
    
    flagi := 1;
    flagstop := 1;
  end;
  
  if (flagi = 1) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x + 4;
    figure[k, 2].x := figure[k, 2].x + 2;
    figure[k, 4].x := figure[k, 4].x - 2;
    
    figure[k, 1].y := figure[k, 1].y + 1;
    figure[k, 3].y := figure[k, 3].y - 1;
    figure[k, 4].y := figure[k, 4].y - 2;
    
    flagi := 2;
    flagstop := 1;
  end;
  
  if (flagi = 2) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x - 2;
    figure[k, 3].x := figure[k, 3].x + 2;
    figure[k, 4].x := figure[k, 4].x + 4;
    
    figure[k, 1].y := figure[k, 1].y + 2;
    figure[k, 2].y := figure[k, 2].y + 1;
    figure[k, 4].y := figure[k, 4].y - 1;
    
    flagi := 3;
    flagstop := 1;
  end;
  
  if (flagi = 3) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x - 4;
    figure[k, 2].x := figure[k, 2].x - 2;
    figure[k, 4].x := figure[k, 4].x + 2;
    
    figure[k, 1].y := figure[k, 1].y - 1;
    figure[k, 3].y := figure[k, 3].y + 1;
    figure[k, 4].y := figure[k, 4].y + 2;
    
    flagi := 0;
    flagstop := 1;
  end;
  
end;



procedure rotateJ(var flagi: integer);
var
  flagstop: integer;
begin
  flagstop := 0;
  
  if (flagi = 0) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x + 4;
    figure[k, 2].x := figure[k, 2].x + 2;
    figure[k, 4].x := figure[k, 4].x - 2;
    
    figure[k, 1].y := figure[k, 1].y;
    figure[k, 2].y := figure[k, 2].y - 1;
    figure[k, 4].y := figure[k, 4].y + 1;
    
    flagi := 1;
    flagstop := 1;
  end;
  
  if (flagi = 1) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x;
    figure[k, 2].x := figure[k, 2].x + 2;
    figure[k, 4].x := figure[k, 4].x - 2;
    
    figure[k, 1].y := figure[k, 1].y + 2;
    figure[k, 2].y := figure[k, 2].y + 1;
    figure[k, 4].y := figure[k, 4].y - 1;
    
    flagi := 2;
    flagstop := 1;
  end;
  
  if (flagi = 2) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x - 4;
    figure[k, 2].x := figure[k, 2].x - 2;
    figure[k, 4].x := figure[k, 4].x + 2;
    
    figure[k, 1].y := figure[k, 1].y;
    figure[k, 2].y := figure[k, 2].y + 1;
    figure[k, 4].y := figure[k, 4].y - 1;
    
    flagi := 3;
    flagstop := 1;
  end;
  
  if (flagi = 3) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x;
    figure[k, 2].x := figure[k, 2].x - 2;
    figure[k, 4].x := figure[k, 4].x + 2;
    
    figure[k, 1].y := figure[k, 1].y - 2;
    figure[k, 2].y := figure[k, 2].y - 1;
    figure[k, 4].y := figure[k, 4].y + 1;
    
    flagi := 0;
    flagstop := 1;
  end;
  
end;





procedure rotateL(var flagi: integer);
var
  flagstop: integer;
begin
  flagstop := 0;
  
  if (flagi = 0) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x;
    figure[k, 2].x := figure[k, 2].x - 2;
    figure[k, 4].x := figure[k, 4].x + 2;
    
    figure[k, 1].y := figure[k, 1].y + 2;
    figure[k, 2].y := figure[k, 2].y + 1;
    figure[k, 4].y := figure[k, 4].y - 1;
    
    flagi := 1;
    flagstop := 1;
  end;
  
  if (flagi = 1) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x - 4;
    figure[k, 2].x := figure[k, 2].x - 2;
    figure[k, 4].x := figure[k, 4].x + 2;
    
    figure[k, 1].y := figure[k, 1].y;
    figure[k, 2].y := figure[k, 2].y - 1;
    figure[k, 4].y := figure[k, 4].y + 1;
    
    flagi := 2;
    flagstop := 1;
  end;
  
  if (flagi = 2) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x;
    figure[k, 2].x := figure[k, 2].x + 2;
    figure[k, 4].x := figure[k, 4].x - 2;
    
    figure[k, 1].y := figure[k, 1].y - 2;
    figure[k, 2].y := figure[k, 2].y - 1;
    figure[k, 4].y := figure[k, 4].y + 1;
    
    flagi := 3;
    flagstop := 1;
  end;
  
  if (flagi = 3) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x + 4;
    figure[k, 2].x := figure[k, 2].x + 2;
    figure[k, 4].x := figure[k, 4].x - 2;
    
    figure[k, 1].y := figure[k, 1].y;
    figure[k, 2].y := figure[k, 2].y + 1;
    figure[k, 4].y := figure[k, 4].y - 1;
    
    flagi := 0;
    flagstop := 1;
  end;
  
end;




procedure rotateS(var flagi: integer);
var
  flagstop: integer;
begin
  flagstop := 0;
  
  if (flagi = 0) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x - 2;
    figure[k, 3].x := figure[k, 3].x - 2;
    figure[k, 4].x := figure[k, 4].x;
    
    figure[k, 1].y := figure[k, 1].y + 1;
    figure[k, 3].y := figure[k, 3].y - 1;
    figure[k, 4].y := figure[k, 4].y - 2;
    
    flagi := 1;
    flagstop := 1;
  end;
  
  if (flagi = 1) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x - 2;
    figure[k, 3].x := figure[k, 3].x + 2;
    figure[k, 4].x := figure[k, 4].x + 4;
    
    figure[k, 1].y := figure[k, 1].y - 1;
    figure[k, 3].y := figure[k, 3].y - 1;
    figure[k, 4].y := figure[k, 4].y;
    
    flagi := 2;
    flagstop := 1;
  end;
  
  if (flagi = 2) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x + 2;
    figure[k, 3].x := figure[k, 3].x + 2;
    figure[k, 4].x := figure[k, 4].x;
    
    figure[k, 1].y := figure[k, 1].y - 1;
    figure[k, 3].y := figure[k, 3].y + 1;
    figure[k, 4].y := figure[k, 4].y + 2;
    
    flagi := 3;
    flagstop := 1;
  end;
  
  if (flagi = 3) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x + 2;
    figure[k, 3].x := figure[k, 3].x - 2;
    figure[k, 4].x := figure[k, 4].x - 4;
    
    figure[k, 1].y := figure[k, 1].y + 1;
    figure[k, 3].y := figure[k, 3].y + 1;
    figure[k, 4].y := figure[k, 4].y;
    
    flagi := 0;
    flagstop := 1;
  end;
  
end;





procedure rotateT(var flagi: integer);
var
  flagstop: integer;
begin
  flagstop := 0;
  
  if (flagi = 0) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x + 2;
    figure[k, 2].x := figure[k, 2].x + 2;
    figure[k, 4].x := figure[k, 4].x - 2;
    
    figure[k, 1].y := figure[k, 1].y + 1;
    figure[k, 2].y := figure[k, 2].y - 1;
    figure[k, 4].y := figure[k, 4].y + 1;
    
    flagi := 1;
    flagstop := 1;
  end;
  
  if (flagi = 1) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x - 2;
    figure[k, 2].x := figure[k, 2].x + 2;
    figure[k, 4].x := figure[k, 4].x - 2;
    
    figure[k, 1].y := figure[k, 1].y + 1;
    figure[k, 2].y := figure[k, 2].y + 1;
    figure[k, 4].y := figure[k, 4].y - 1;
    
    flagi := 2;
    flagstop := 1;
  end;
  
  if (flagi = 2) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x - 2;
    figure[k, 2].x := figure[k, 2].x - 2;
    figure[k, 4].x := figure[k, 4].x + 2;
    
    figure[k, 1].y := figure[k, 1].y - 1;
    figure[k, 2].y := figure[k, 2].y + 1;
    figure[k, 4].y := figure[k, 4].y - 1;
    
    flagi := 3;
    flagstop := 1;
  end;
  
  if (flagi = 3) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x + 2;
    figure[k, 2].x := figure[k, 2].x - 2;
    figure[k, 4].x := figure[k, 4].x + 2;
    
    figure[k, 1].y := figure[k, 1].y - 1;
    figure[k, 2].y := figure[k, 2].y - 1;
    figure[k, 4].y := figure[k, 4].y + 1;
    
    flagi := 0;
    flagstop := 1;
  end;
  
end;




procedure rotateZ(var flagi: integer);
var
  flagstop: integer;
begin
  flagstop := 0;
  
  if (flagi = 0) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x + 2;
    figure[k, 3].x := figure[k, 3].x - 2;
    figure[k, 4].x := figure[k, 4].x - 4;
    
    figure[k, 1].y := figure[k, 1].y - 1;
    figure[k, 3].y := figure[k, 3].y - 1;
    figure[k, 4].y := figure[k, 4].y;
    
    flagi := 1;
    flagstop := 1;
  end;
  
  if (flagi = 1) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x + 2;
    figure[k, 3].x := figure[k, 3].x + 2;
    figure[k, 4].x := figure[k, 4].x;
    
    figure[k, 1].y := figure[k, 1].y + 1;
    figure[k, 3].y := figure[k, 3].y - 1;
    figure[k, 4].y := figure[k, 4].y - 2;
    
    flagi := 2;
    flagstop := 1;
  end;
  
  if (flagi = 2) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x - 2;
    figure[k, 3].x := figure[k, 3].x + 2;
    figure[k, 4].x := figure[k, 4].x + 4;
    
    figure[k, 1].y := figure[k, 1].y + 1;
    figure[k, 3].y := figure[k, 3].y + 1;
    figure[k, 4].y := figure[k, 4].y;
    
    flagi := 3;
    flagstop := 1;
  end;
  
  if (flagi = 3) and (flagstop = 0) then
  begin
    figure[k, 1].x := figure[k, 1].x - 2;
    figure[k, 3].x := figure[k, 3].x - 2;
    figure[k, 4].x := figure[k, 4].x;
    
    figure[k, 1].y := figure[k, 1].y - 1;
    figure[k, 3].y := figure[k, 3].y + 1;
    figure[k, 4].y := figure[k, 4].y + 2;
    
    flagi := 0;
    flagstop := 1;
  end;
  
end;



procedure layercheck;
var
  i, i1, j1, j, r, iy, s: integer;
begin
  for i := 20 downto 1 do
  begin
    s := 0;
    iy := i;
    
    for j := 1 to k do
      
      for r := 1 to 4 do
        if figure[j, r].y = i then s := s + figure[j, r].x;
    
    if s = 110 then
    begin
      score := score + 100;
      for i1 := 1 to k do
        
        for j1 := 1 to 4 do
        begin
          if figure[i1, j1].y = iy then
          begin
            figure[i1, j1].x := 1;
            figure[i1, j1].y := 21;
          end;
          if figure[i1, j1].y < iy then figure[i1, j1].y := figure[i1, j1].y + 1;
        end;
    end;
  end;
end;



procedure collisioncheck;
var
  i, j, j1, r1, r2, r: integer;
begin
  
  for i := 1 to k - 1 do
    
    for j := 1 to 4 do
      
      for r := 1 to 4 do
      begin
        c1 := i;
        if figure[k, j].x = figure[i, r].x then for j1 := 1 to 4 do
            
            for r1 := 1 to 4 do
            begin
              t1 := j1;
              t2 := r1;
              if figure[k, j1].x = figure[c1, r1].x then if figure[k, j1].y + 1 = figure[c1, r1].y then begin k := k + 1; flagf := true; flagch := true; for r2 := 1 to 20 do layercheck; flagcolor:=1; break; end;
            end;
        
        
        
      end;
  
end;




procedure SpaceSkip;
var i,j,r1,r,flagspace:integer;
begin
 flagspace:=0;
 for i:=figure[k,1].y to 20 do
 begin

  for r1:=1 to k-1 do
   for j:=1 to 4 do
    for r:=1 to 4 do
     if (figure[k,j].x=figure[r1,r].x)and(figure[k,j].y+1=figure[r1,r].y) then flagspace:=1;;

  for j:=1 to 4 do
   if figure[k,j].y=20 then flagspace:=1;

  if flagspace=1 then break;
  
  for j:=1 to 4 do
   figure[k,j].y:=figure[k,j].y+1;
   
  key:='q';
  count:=8;
  
 end;
end;




procedure rotate(var flagi:integer);
var i,j,j1,r:integer;
    begin
      if z = 1 then rotateI(flagi);
      if z = 2 then rotateJ(flagi);
      if z = 3 then rotateL(flagi);
      if z = 5 then rotateS(flagi);
      if z = 6 then rotateT(flagi);
      if z = 7 then rotateZ(flagi);

      for i:=1 to 4 do
       if (figure[k,i].x<2)or(figure[k,i].x>20)or(figure[k,i].y<1)or(figure[k,i].y>20) then
                                                                                       begin
                                                                                        if z = 1 then for j:=1 to 3 do rotateI(flagi);
                                                                                        if z = 2 then for j:=1 to 3 do rotateJ(flagi);
                                                                                        if z = 3 then for j:=1 to 3 do rotateL(flagi);
                                                                                        if z = 5 then for j:=1 to 3 do rotateS(flagi);
                                                                                        if z = 6 then for j:=1 to 3 do rotateT(flagi);
                                                                                        if z = 7 then for j:=1 to 3 do rotateZ(flagi);
                                                                                       end;

     for i:=1 to k-1 do
      for j:=1 to 4 do
       for r:=1 to 4 do
        if (figure[k,j].x=figure[i,r].x)and(figure[k,j].y=figure[i,r].y) then
                                                                          begin
                                                                           if z = 1 then for j1:=1 to 3 do rotateI(flagi);
                                                                           if z = 2 then for j1:=1 to 3 do rotateJ(flagi);
                                                                           if z = 3 then for j1:=1 to 3 do rotateL(flagi);
                                                                           if z = 5 then for j1:=1 to 3 do rotateS(flagi);
                                                                           if z = 6 then for j1:=1 to 3 do rotateT(flagi);
                                                                           if z = 7 then for j1:=1 to 3 do rotateZ(flagi);
                                                                          end;


      key := 'q';
    end;

begin
  hidecursor;
  crtwindowsize(35,20);
  randomize;
  flagch := true; flagf := true; flagmove := true; flagcolor:=1;
  k := 1;
  
  textbackground(black);
  clrscr;
  
  game := true;
  while game do
  begin
    
    textcolor(white);
    ramka;
    
    if flagcolor=1 then begin figure[k,1].z:=random(6)+9; flagcolor:=0; end;
    
    if flagch = true then randomfigure(z1, z2);
    if z1 = 0 then z1 := random(7) + 1;
    
    z := z1;
    
    if (z = 1) and (flagf = true) then FigureI;
    if (z = 2) and (flagf = true) then FigureJ;
    if (z = 3) and (flagf = true) then FigureL;
    if (z = 4) and (flagf = true) then FigureO;
    if (z = 5) and (flagf = true) then FigureS;
    if (z = 6) and (flagf = true) then FigureT;
    if (z = 7) and (flagf = true) then FigureZ;
    
    
    if keypressed then key := readkey;
    
    if key = 'd' then moveright;
    
    if key = 'a' then moveleft;
    
    
    if key = 'w' then rotate(flagi);
                                                                                       
    for i := 1 to k do
    
    begin
     textcolor(figure[i,1].z);
      
      for j := 1 to 4 do
      if figure[i,j].y<>21 then begin
                                 gotoxy(figure[i, j].x, figure[i, j].y);
                                 write('[]');
                                end;
      
    end;
    
    collisioncheck;
    
    for i := 1 to 4 do
      if k > 1 then if figure[k - 1, i].y = 1 then game := false;
    
    
    
  if count=9 then  for i := 1 to 4 do
      figure[k, i].y := figure[k, i].y + 1;
      
    if key =#32 then SpaceSkip;
    
    textcolor(white);
    gotoxy(24, 4);
    write('NEXT FIGURE');
    
    if z2 = 1 then begin gotoxy(25, 6); write('[][][][]'); end;
    if z2 = 2 then begin gotoxy(26, 6); write('[]'); gotoxy(26, 7); write('[][][]'); end;
    if z2 = 3 then begin gotoxy(30, 6); write('[]'); gotoxy(26, 7); write('[][][]'); end;
    if z2 = 4 then begin gotoxy(27, 6); write('[][]'); gotoxy(27, 7); write('[][]'); end;
    if z2 = 5 then begin gotoxy(28, 6); write('[][]'); gotoxy(26, 7); write('[][]'); end;
    if z2 = 6 then begin gotoxy(28, 6); write('[]'); gotoxy(26, 7); write('[][][]'); end;
    if z2 = 7 then begin gotoxy(26, 6); write('[][]'); gotoxy(28, 7); write('[][]'); end;
    
    gotoxy(25, 15);
    write('SCORE: ', score);
    
    if key='s' then begin count :=8; key:='q' end;
    
   count:=count+1;
   if count=10 then count:=0;
    delay(100);
    
    if count=9 then for i := 1 to 4 do
                     if figure[k, i].y =20 then begin k := k + 1; flagf := true; flagch := true; for r := 1 to 20 do layercheck; flagcolor:=1; break; end;
    
    clrscr;
    
    
    
  end;
  
  writeln('GAME OVER');
  Writeln('YOUR SCORE :', score);
  
end.