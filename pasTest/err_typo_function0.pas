program exFunction;
var
   a, b, ret : integer;  c : integer;
   
(*function definition *)
function max(num1, num2: integer): integer;
var
   (* local variable declaration *)
   result: integer;
begin
   if (num1 > num2) then
      resul := num1 (* error *)
   else
      result := num2;
   max := result;
end;
begin
   a := 100;
   b := 200;
  (* calling a function to get max value *)
   ret := max(a, b);
   wrte("Max value is :"); (* error *)
   writeln(ret );
end.