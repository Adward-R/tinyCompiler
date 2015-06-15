program gogoto;
var a: integer;
begin
	a := 1;
	goto 2;
	a := a+2;
	2: a := a+1;
	writeln(a);
end.
