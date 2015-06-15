program case1;
var month, days:integer;
begin
write("Input month:");
read(month);

	case (month) of
	1:days:=31;
	2:days:=28;
	3:days:=31;
	4:days:=30;
	5:days:=31;
	6:days:=30;
	7:days:=31;
	8:days:=31;
	9:days:=30;
	10:days:=31;
	11:days:=31;
	12:days:=30;
	
	end;
writeln("days=");
writeln(days);
end.
