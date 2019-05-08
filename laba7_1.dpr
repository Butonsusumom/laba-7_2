program laba7_1;
 
{$APPTYPE CONSOLE}
 
uses
  SysUtils,
  Windows;

type MySet=set of 1..255;
const N=10;
var X1,X2,X3,Y,Y1,S:MySet;
    i,j,key:integer;
   name:string;

procedure enter(s:string);
var i,a:integer;
    m:MySet;
begin
Writeln('Please, enter set ', s,' , wich consist 10 elements from 1 to 100');
m:=[];
for i:=1 to n do
 begin
  repeat
  read(a);
  until(a in [1..100])and not(a in m);
  m:=m+[a];

 end;
 Writeln;
 if s='X1' then X1:=m;
 if s='X2' then X2:=m;
 if s='X3' then X3:=m;
end;

procedure constant(s:string);
begin
  if s='X1' then X1:=[2,5,6,8,10,19,20,26,58,49];
  if s='X2' then X2:=[5,6,7,10,19,56,58,78,88,90];
  if s='X3' then X3:=[3,5,6,9,10,20,26,58,88,98];
end;

procedure generate(s:string);
var i,a:integer;
    m:MySet;
begin
m:=[];
for i:=1 to n do
 begin
  repeat
  a:=Random(100)+1;
  until not(a in m);
  m:=m+[a];
 end;
 if s='X1' then X1:=m;
 if s='X2' then X2:=m;
 if s='X3' then X3:=m;
end;

procedure output(m:MySet;s:string);
var i:Integer;
begin
 Writeln(s,' set:');
  for i:=1 to 100 do
   begin
     if i in m then write(i:4);
   end;
  Writeln;
end;

procedure Power(m:MySet;s:string);
var k,i:integer;
 begin
   k:=0;
   Write(s,' set power:');
  for i:=1 to 100 do
   begin
     if i in m then inc(k);
   end;
   write(k);
  Writeln;
 end;


begin
for i:=1 to 3 do
begin
  key:=0;
  case i of
  1: name:='X1';
  2: name:='X2';
  3: name:='X3';
   end;
Writeln ('How do you want to define set ',name,'?');
Writeln ('1.Enter from the keyboard ');
Writeln ('2.Use a constant set');
Writeln ('3.Generate a random set');
while (key<>1) and (key<>2) and (key<>3) do
begin
readln(key);
case key of
1: enter(name);
2: constant(name);
3: generate(name);
end;
end;
Writeln;
end;


Y:=(x1-x2)+(x2*x3);
Y1:=[];
for i:=1 to 100 do
 begin
   if (i in Y) and (i mod 4=0) then
   Y1:=Y1+[i]
 end;

 Output(X1,'X1');
 Output(X2,'X2');
 Output(X3,'X3');
 Output(Y,'Y');
 Output(Y1,'Y1');
 Power(Y1,'Y1');
 readln;
end.
