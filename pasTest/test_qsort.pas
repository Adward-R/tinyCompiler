program sim1;
    var a: array [0..10] of integer; i: integer;
    procedure qsort(s: integer; t: integer);
        var i, j: integer; m: integer;

    	procedure swapPlus(var i: integer; var j: integer);
    	var temp: integer;
    	begin
    		temp := a[i];
    		a[i] := a[j];
    		a[j] := temp;
    		i := i + 1;
    		j := j - 1;
    	end;

    begin
    	m := s;
    	i := s;
    	j := t;
    	repeat
    		while a[i] < a[m] do i := i + 1;
    		while a[j] > a[m] do j := j - 1;

    		if i <= j then swapPlus(i, j);
    	until i > j;

    	if j > s then qsort(s, j);
    	if i < t then qsort(i, t);
    end;
begin
(*    a[0] := 10;
    a[1] := 13;
    a[2] := 53;
    a[3] := 23;
    a[4] := 183;
    a[5] := 14;
    a[6] := 113;
    a[7] := 763;
    a[8] := 134;
    a[9] := 123;
    a[10] := 130;*)

    for i := 10 downto 0 do read(a[i]);
    qsort(0, 10);

    i := 0;
    repeat
        write(a[i]);
        write(' ');
        i := i + 1;
    until i > 10;
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