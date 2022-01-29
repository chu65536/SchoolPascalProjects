program abc;
 uses crt;
 var a:array[1..100,1..100]of integer;
     r,s,i,i1,j1,j,x,flagn,flagm,n,m,n1,m1,k,k1,k2,flagz,flag:integer;
begin
 crtwindowsize(124,62);
 window(1,1,124,62);
 
 j1:=1;
 i1:=0;
 
 readln(n);
 m:=n;
 
 x:=m*n;
 
 n1:=n;
 m1:=m;

repeat

  flagz:=0;

  if (flagn=0)and(flag=0) then begin for i:=1+k1 to m do
                                     begin
                                      a[j1,i]:=x;
                                      x:=x-1;
                                      i1:=i1+1;
                                      flagz:=1;
                                      flag:=1;
                                     end;
                                     flagn:=1;
                                     m:=m-1;
                               end;
                               
  if (flagm=0)and(flag=1) then begin for i:=2 +k1 to n do
                                     begin
                                      a[i,i1]:=x;
                                      x:=x-1;
                                      j1:=j1+1;
                                      flagz:=1;
                                      flag:=2;
                                     end;
                                     flagm:=1;
                                     n:=n-1;
                                     k:=k+1;
                              end;
                               
  if (flagn=1)and(flag=2) then begin for i:=m downto 1+k2 do
                                     begin
                                      a[j1,i]:=x;
                                      x:=x-1;
                                      i1:=i1-1;
                                      flagz:=1;
                                      flag:=3;
                                     end;
                                     flagn:=0;
                                     k1:=k1+1;
                                     m:=m-1;
                               end;
                               
  if (flagm=1)and(flag=3) then begin for i:=n downto 1+k do
                                     begin
                                      a[i,i1]:=x;
                                      x:=x-1;
                                      j1:=j1-1;
                                      flagz:=1;
                                      flag:=0;
                                     end;
                                     flagm:=0;
                                     n:=n-1;
                               end;
                               
  n:=n+1;
  m:=m+1;
  k2:=k;
until (flagz=0);

 if n1 mod 2=1 then
 
  for i:=n1 downto 1 do
 begin

  for j:=m1 downto 1 do
  begin

   for r:=1 to a[i,j] do
    if a[i,j] mod r =0 then s:=s+1;

   if s=2 then textbackground(black)
          else textbackground(LightGray);
   if a[i,j]=1 then textbackground(red);

   s:=0;
   write('  ');
  end;

  writeln;
 end
 
 else
                  
 for i:=1 to n1 do
 begin

  for j:=1 to m1 do
  begin

   for r:=1 to a[i,j] do
    if a[i,j] mod r =0 then s:=s+1;
    
   if s=2 then textbackground(black)
          else textbackground(LightGray);
   if a[i,j]=1 then textbackground(red);

   s:=0;
   write('  ');
  end;

  writeln;
 end;
                 
 end.

 
 
 
 

