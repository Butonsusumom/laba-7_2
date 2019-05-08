program laba7_2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type MySet = set of Char;

  var s,firstplayer,secondplayer:string;
  j,k:Integer;
  exit:Boolean;

 procedure fir;
begin
  SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ),FOREGROUND_BLUE or FOREGROUND_INTENSITY);
  write('first');
  SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ), FOREGROUND_BLUE or FOREGROUND_INTENSITY or FOREGROUND_GREEN or FOREGROUND_RED );
end;

procedure sec;
begin
   SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ),FOREGROUND_RED or FOREGROUND_INTENSITY);
   write('second');
   SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ), FOREGROUND_BLUE or FOREGROUND_INTENSITY or FOREGROUND_GREEN or FOREGROUND_RED );
end;

procedure cleanscreen;
var
 ConsoleHandle:THandle;
 ConsoleInfo: TConsoleScreenBufferInfo;
 Coord,Coord1:TCoord;
 WrittenChars:DWORD;
  hStdOut: HWND;
begin

  hStdOut := GetStdHandle(STD_OUTPUT_HANDLE);
 FillChar(ConsoleInfo,SizeOf(TConsoleScreenBufferInfo),0);
 FillChar(Coord,SizeOf(TCoord),0);
 ConsoleHandle:=GetStdHandle(STD_OUTPUT_HANDLE);
 GetConsoleScreenBufferInfo(ConsoleHandle, ConsoleInfo);
 FillConsoleOutputCharacter(ConsoleHandle,' ', ConsoleInfo.dwSize.X * ConsoleInfo.dwSize.Y, Coord, WrittenChars);
  Coord1.X := 0;
  Coord1.Y := 0;
  SetConsoleCursorPosition(hStdOut, Coord1);


end;


procedure rules;
 begin
  Write ('Hi!Welcome to the game');
  SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ),FOREGROUND_BLUE or FOREGROUND_INTENSITY or FOREGROUND_RED);
  Write(' ''QUESS STRING''');
  SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ), FOREGROUND_BLUE or FOREGROUND_INTENSITY or FOREGROUND_GREEN or FOREGROUND_RED );
  Writeln;
  Writeln ('Rules are the following:');
  Write ('The ');
 fir;
  Write(' player enters 10 letters of the Latin alphabet.');
  Writeln;
  Write ('The ');
sec;
  Write(' player try to quess this 10 letters in 3 attempts.');
  Writeln;
  Write('The ');
  sec;
  Write(' player wins when he guesses more than 5 symbols.');
  writeln;
  Write('The ');
  fir;
  Write(' player wins when the ');
sec;
  Write(' guesses less than 5 symbols.');
  Writeln;
  Writeln('Otherwise - draw');
  Writeln ('Do you want to play?');
 end;





 function checkstring(s:string):boolean;
 var i:Integer;
 begin
   result:=true;
   if length(s)<>10 then
   begin
   result:=false;
   Writeln('Oh no, you enter ',Length(s),' symbols,try ones again!');
   end
    else
     begin
       for i:=1 to 10 do
        begin
          if not (s[i] in ['A'..'z']) then
           result:=False;
        end;
       if Result= false then
         Writeln('Oh no, you enter not only latinic letters,try ones again!');
     end;

 end;

 procedure first;
 var flag:Boolean;

 begin
   Write('It''s ');
   fir;
   Write(' player turn!');
   writeln;
   Writeln('Please, enter 10 latinic letters');
   repeat
   firstplayer:='';
   readln(firstplayer);
   flag:=checkstring(firstplayer);
   until  flag= True;

 end;

 procedure second;
var flag:Boolean;
g:integer;
h:string;
 begin
   SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ),FOREGROUND_GREEN or FOREGROUND_INTENSITY);
   case j of
   1:write('first');
   2:write('second');
   3:write('third');
   end;
   SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ), FOREGROUND_BLUE or FOREGROUND_INTENSITY or FOREGROUND_GREEN or FOREGROUND_RED );
   write(' try');
   writeln;
   if k<>0 then writeln('You already guess ',k,' symbols');
   Writeln('Please, enter ',10,' latinic letters');

   repeat
   secondplayer:='';
   readln(secondplayer);
   flag:=checkstring(secondplayer);
   until  flag=True;
 end;

procedure mistakes;
var
  i:Integer;

  begin
    k:=0;
    Write('The ');
   sec;
    Write(' player finish his ', j,' try');
    Writeln;
    Writeln('So,let''s check what he guess');
    write('     ');
    for i:=1 to 10 do
     begin
        if firstplayer[i]=secondplayer[i] then
        begin
           Inc(k);
         SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ),BACKGROUND_GREEN);
         write(secondplayer[i]);
         end
        else
        begin

          SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ),BACKGROUND_RED);
        write(secondplayer[i]);
        end;
     end;
      Writeln;

     SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ),0 );
     SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ),
                            FOREGROUND_BLUE or FOREGROUND_INTENSITY or FOREGROUND_GREEN or FOREGROUND_RED );
     Writeln(k,' symbols are guessed');
     Writeln;
     if j=3 then writeln('That was last try')
     else
     Writeln('There are ',3-j,' tryies left');
    if k=10 then Exit:=True;
  end;

procedure cleanbackground;
begin
           SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ),0 );
         Writeln('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
          Writeln('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
           Writeln('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
          SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ),
                            FOREGROUND_BLUE or FOREGROUND_INTENSITY or FOREGROUND_GREEN or FOREGROUND_RED );
end;



begin
  rules;
  readln(s);
  while (s='Yes') or (s='yEs') or (s='yeS') or (s='YEs') or (s='yES') or (s='YeS') or (s='YES') or (s='yes')do
  begin
  Writeln('Press ''Enter'' to start...');
  Readln;
  cleanscreen;
  first;
  Writeln('Press ''Enter'' to  second player start...');
  readln;
  cleanscreen;
  exit:=False;
  j:=0;
    Write('It''s ');
    sec;
    Write(' player turn!');
    Writeln;
  while (j<3) and (Exit=false) do
  begin
     Inc(j);
    second;
    Readln;
    cleanscreen;
    if Exit=False then
       mistakes;
       Readln;
       cleanscreen;
       cleanbackground;
    cleanscreen;
  end;
  Writeln;
  Writeln;
 if k<5 then
  begin
    Write('The ');
    SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ),FOREGROUND_RED or FOREGROUND_INTENSITY);
   write('FIRST');
   SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ), FOREGROUND_BLUE or FOREGROUND_INTENSITY or FOREGROUND_GREEN or FOREGROUND_RED );
    Write(' player wins, there are ',k,' symbols are guessed, congratulations');
    writeln;
  end;
 if k>5 then
  begin
     Write('The ');
   SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ),FOREGROUND_RED or FOREGROUND_INTENSITY);
   write('SECOND');
   SetConsoleTextAttribute( GetStdHandle( STD_OUTPUT_HANDLE ), FOREGROUND_BLUE or FOREGROUND_INTENSITY or FOREGROUND_GREEN or FOREGROUND_RED );
   Write(' player wins there are ',k,' symbols are guessed, congratulations');
   Writeln;
  end;
 if k=5 then
  begin
    Writeln('It is a DRAW, congratulations to bouth players');
  end;
 Writeln('Try again?');
 Readln (s);
 end;

Writeln('Goodbye, see you soon ^_^');
Writeln('Press ''Enter'' to exit...');
Readln;
end.


