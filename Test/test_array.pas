program sim1;
    var a: array [0..10] of integer; b: integer; c: integer; i: integer;
begin
    b := 3;
    c := 4;
    writeln(b);
    writeln(c);

    for i := 0 to 10 do a[i] := i;
    for i := 0 to 10 do writeln(a[i] + b);
end.

(*
3
4
3
4
5
6
7
8
9
10
11
12
13
*)