program exFunction;
var
   a, ret : integer;  c : integer; b : float; (* b originally integer*)
   
(*function definition *)
function max(num1, num2: integer): integer;
var
   (* local variable declaration *)
   result: integer;
   (* result: float *)
begin
   if (num1 > num2) then
      result := num1 (* error *)
   else
      result := num2;
   max := result;
end;
begin
   a := 100;
   b := 200.01; (* 200 *)
  (* calling a function to get max value *)
   ret := max(a, b); (* mismatch *)
   write("Max value is :"); (* error *)
   writeln(ret );
end.