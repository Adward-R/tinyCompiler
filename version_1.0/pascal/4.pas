program if1;
var a,b,t:real;
begin
write("Input a,b=");
read(a);
read(b);
if(a>b) then
begin
t:=a;
a:=b;
b:=t;
end;
end.
