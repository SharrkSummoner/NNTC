program exam;

var
value: string;
min, max: char;
str_len, temp_value, index: integer;

begin
repeat
writeln('Enter a natural number');
readln(value);
val(value, temp_value, index);
if index <> 0 then writeln('Number input error');
until (index = 0) and not (value[1] = '-');

str_len:= length(value);
min:= '9';
max:= '0';

while str_len > 0 do
begin
if value[str_len] < min then min:= value[str_len];
if value[str_len] > max then max:= value[str_len];
str_len:= str_len - 1;
end;

writeln('Max numeral: ', max);
writeln('Min numeral: ', min);

readln;
end.
