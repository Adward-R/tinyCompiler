program sim1;
    var a, b, s: integer; ch: char;
    procedure proc(c: integer; d: integer);
    begin
    	a := c + d;
    	write(a);
        write(' ');
    end;
    function func_int(a: integer; b: integer):integer;
    begin
        a := a + b;
        b := a + b;
        func_int := a + b;
    end;
    function func_char(ch: char): char;
    begin
        func_char := ch + '!';
    end;
begin
    a := 1;
    b := 2;
    write(a);
    write(' ');
    write(b);
    write(' ');
    s := func_int(3, 4);
    write(s);
    write(' ');
    write(a);
    write(' ');
    write(b);
    write(' ');

    ch := ' ';
    ch := func_char(ch);
    write(ch);
    write(' ');
end.
