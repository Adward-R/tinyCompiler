program sim1;
    var a, c, d: integer;
    procedure proc(var a: integer; b: integer);
    begin
    	a := a + b;
        b := a + b;
    end;
    function func_int(var a: integer; b: integer):integer;
    begin
        a := a + b;
        b := a + b;
        func_int := a + b;
    end;
begin
    c := 3;
    d := 4;
    write(c); write(' ');
    write(d); write(' ');

    proc(c, d);
    write(c); write(' ');
    write(d); write(' ');

    a := func_int(c, d);
    write(a); write(' ');
    write(c); write(' ');
    write(d); write(' ');
end.

(*
3 4 7 4 26 11 4
*)