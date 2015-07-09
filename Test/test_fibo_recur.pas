program sim1;
    var a, i: integer;
    function fibo(i: integer): integer;
    begin
        if i < 3 then
            fibo := 1
        else
            fibo := fibo(i - 1) + fibo(i - 2);
    end;
begin
    for i := 1 to 10 do writeln(fibo(i));
end.

(*
1 1 2 3 5 8 13 21 34 55 
*)