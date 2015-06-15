program sim1;
    var a, b, s: integer;
    procedure proc(c: integer; d: integer);
    begin
    	a := c + d;
    	write(a);
    end;
begin
	a := 1;
	write(a);

	proc(1, 2);

    for b := 1 to 2 do write(b);

    for b := 5 downto 1 do write(b);

    repeat
    	b := b + 1;
    	write(b);
    until b > 4;

    while a < 10 do proc(a, 1);
end.

(*
1 3 12 54321 2345 45678910
*)