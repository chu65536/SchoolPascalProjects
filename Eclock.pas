program clock;
 uses crt;
 var a,b,i,j,x,x1,m1,m2,sec,s1,s2:integer;

 procedure zero;
 begin
  gotoxy(x1,3);
  write('        ');
  gotoxy(x1,9);
  write('        ');
  
  for i:=3 to 9 do
  begin
   gotoxy(x1,i);
   write('  ');
  end;

  for i:=3 to 9 do
  begin
   gotoxy(x1+6,i);
   write('  ');
  end;
 end;



 procedure one;
 begin
 
  for i:=3 to 9 do
  begin
   gotoxy(x1+6,i);
   write('  ');
  end;
 end;


 
 procedure two;
 begin
  gotoxy(x1,3);
  write('        ');
  gotoxy(x1,6);
  write('        ');
  gotoxy(x1,9);
  write('        ');
  
  for i:=3 to 5 do
  begin
   gotoxy(x1+6,i);
   write('  ');
  end;
  
  for i:=6 to 8 do
  begin
   gotoxy(x1,i);
   write('  ');
  end;
 end;
 
 
 
 procedure three;
 begin
  gotoxy(x1,3);
  write('        ');
  gotoxy(x1,6);
  write('        ');
  gotoxy(x1,9);
  write('        ');
  
  x1:=x1+6;
  for i:=3 to 9 do
  begin
   gotoxy(x1,i);
   write('  ');
  end;
 end;


 procedure four;
 begin
 
  gotoxy(x1,6);
  write('        ');
  
  for i:=3 to 6 do
  begin
   gotoxy(x1,i);
   write('  ');
  end;
  
  x1:=x1+6;
  for i:=3 to 9 do
  begin
   gotoxy(x1,i);
   write('  ');
  end;
 end;
 
 
 
 procedure five;
 begin
  gotoxy(x1,3);
  write('        ');
  gotoxy(x1,6);
  write('        ');
  gotoxy(x1,9);
  write('        ');

  for i:=3 to 5 do
  begin
   gotoxy(x1,i);
   write('  ');
  end;

  for i:=6 to 8 do
  begin
   gotoxy(x1+6,i);
   write('  ');
  end;
 end;
 
 
 
 procedure six;
 begin
  gotoxy(x1,3);
  write('        ');
  gotoxy(x1,6);
  write('        ');
  gotoxy(x1,9);
  write('        ');
  
  for i:=3 to 9 do
  begin
   gotoxy(x1,i);
   write('  ');
  end;
  
  for i:=6 to 9 do
  begin
   gotoxy(x1+6,i);
   write('  ');
  end;
 end;
 
 
 
 procedure seven;
 begin
  for i:=3 to 9 do
  begin
   gotoxy(x1+6,i);
   write('  ');
  end;
  
  gotoxy(x1,3);
  write('        ');

 end;
 
 
 
 procedure eight;
 begin
  gotoxy(x1,3);
  write('        ');
  gotoxy(x1,6);
  write('        ');
  gotoxy(x1,9);
  write('        ');

  for i:=3 to 9 do
  begin
   gotoxy(x1,i);
   write('  ');
  end;

  for i:=3 to 9 do
  begin
   gotoxy(x1+6,i);
   write('  ');
  end;
 end;
 
 
 
 procedure nine;
 begin
  gotoxy(x1,3);
  write('        ');
  gotoxy(x1,6);
  write('        ');
  gotoxy(x1,9);
  write('        ');
  
  for i:=3 to 9 do
  begin
   gotoxy(x1+6,i);
   write('  ');
  end;
  
  for i:=3 to 6 do
  begin
   gotoxy(x1,i);
   write('  ');
  end;
 end;
 
 


 
begin
 crtwindowsize(40,10);
 hidecursor;
 
 gotoxy(11,5);
 writeln('ENTER CURRENT TIME');
 gotoxy(18,7);
 readln(a ,b);
 
 clrscr;
 
 m1:=a div 10;
 m2:=a mod 10;
 s1:=b div 10;
 s2:=b mod 10;
 while true do
 begin
  
  textbackground(black);
  
  x1:=32;
  if s2=0 then zero;
  if s2=1 then one;
  if s2=2 then two;
  if s2=3 then three;
  if s2=4 then four;
  if s2=5 then five;
  if s2=6 then six;
  if s2=7 then seven;
  if s2=8 then eight;
  if s2=9 then nine;
  
  x1:=23;
  if s1=0 then zero;
  if s1=1 then one;
  if s1=2 then two;
  if s1=3 then three;
  if s1=4 then four;
  if s1=5 then five;
  if s1=6 then six;
  if s1=7 then seven;
  if s1=8 then eight;
  if s1=9 then nine;
  
  x1:=11;
  if m2=0 then zero;
  if m2=1 then one;
  if m2=2 then two;
  if m2=3 then three;
  if m2=4 then four;
  if m2=5 then five;
  if m2=6 then six;
  if m2=7 then seven;
  if m2=8 then eight;
  if m2=9 then nine;

  x1:=2;
  if m1=0 then zero;
  if m1=1 then one;
  if m1=2 then two;
  if m1=3 then three;
  if m1=4 then four;
  if m1=5 then five;
  if m1=6 then six;
  if m1=7 then seven;
  if m1=8 then eight;
  if m1=9 then nine;

  delay(496);
  
  gotoxy(20,5);
  write('  ');
  gotoxy(20,7);
  write('  ');

  delay(496);
  
  textbackground(white);
  clrscr;
  
  sec:=sec+1;
  if sec=60 then begin sec:=0; s2:=s2+1; end;
  if s2=10 then begin s2:=0; s1:=s1+1; end;
  if s1=6 then begin s1:=0; m2:=m2+1; end;
  if m2=10 then begin m2:=0; m1:=m1+1; end;
  if (m1=2)and(m2=4) then begin m1:=0; m2:=0; end;
 end;

end.
