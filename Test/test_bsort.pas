program sim1;
    var a: array [0..10] of integer; i: integer;
    procedure bsort;
        var i, j: integer;

    	procedure swap(i: integer; j: integer);
    	var temp: integer;
    	begin
    		temp := a[i];
    		a[i] := a[j];
    		a[j] := temp;
    	end;

    begin
    	i := 0;
    	repeat
    		j := i + 1;
    		repeat
    			if a[i] > a[j] then swap(i, j);

    			j := j + 1;
    		until j > 10;

    		i := i + 1;
    	until i > 9;
    end;
begin
    a[0] := 10;
    a[1] := 13;
    a[2] := 53;
    a[3] := 23;
    a[4] := 183;
    a[5] := 14;
    a[6] := 113;
    a[7] := 763;
    a[8] := 134;
    a[9] := 123;
    a[10] := 130;

    bsort;

    for i := 0 to 10 do writeln(a[i]);
end.

(*
10
13
14
23
53
113
123
130
134
183
763
*)