program laba7_3;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  MySet = set of Char;
  var words:string;
      zvon,letters,Y:MySet;
      i:integer;
      flag:Boolean;
      symbol:Char;

function checkstring(s:string):Boolean;
 begin
   result:=True;
   if Pos(',,',s)<>0 then result:=False;
    if (s[1]=',')  or (s[1]='.') or (Pos('.',s)<>Length(s)) then result:=False;
    for i:=1 to Length(s) do
     begin
       if not( s[i] in ['a'..'z',',','.']) then result:=False;
     end;
    if Result=False then Writeln('Uncorrect string.Plese,try ones again');
 end;

begin

zvon:=['b','v','g','d','z','l','m','n','r'];
  Writeln('Please enter words, wich consist only from separated by commas. Put an end at the end.');

  repeat
  words:='';
  Readln(words);
  flag:=checkstring(words);
  until flag=true;
  Writeln('Voiced consonants:');
  Writeln('b d g l m n r v');
 letters:=[];

 for i:=1 to Length(words) do
 begin
   if not(words[i] in letters) and (words[i]<>',') and (words[i]<>'.') then
   begin
     letters:=letters+[words[i]];
   end;

 end;

 Writeln('All defferent letters from all words:');
 for I := 0 to 255 do
    if Chr(I) in letters then
      Write(Chr(I) + ' ');
   Writeln;
  Y:=zvon*letters;
  Writeln('Voiced consonants that occur at least once in words:');
      for I := 0 to 255 do
    if Chr(I) in Y then
      Write(Chr(I) + ' ');
      Readln;

end.
 