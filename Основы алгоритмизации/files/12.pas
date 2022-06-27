Program TtxFile;
type zap=record
    p1:string[5];
    p2:byte;
  end;
var
  f:text; {объявление текстовой файловой  переменной }
  x:zap; ch:char;
begin
assign(f,'prim1.dat'); {связывание файловой переменной с файлом}
rewrite(f);{открыть файл для записи}
  repeat      {пока не введена с клавиатуры *}
  readln(x.p1, x.p2);  {вводим запись с клавиатуры}
  writeln(f,x.p1, x.p2); {и пишем в файл }
  write('ch=');
  readln(ch);
  until ch='*';
  close(f); {закрыть  файл}
  reset(f); {открыть файл для чтения}
  while not eof(f) do;{пока не конец  файла}
    begin
      readln(f,x.p1, x.p2);  {читаем из файла}
      writeln(x.p1, x.p2);    { выводим на экран}
    end;
  readln;
end.