class transaction;
  bit a;
  bit b;
  bit cin;
  bit sum;
  bit carry;

  function void display(string name);
    $display("[%s] a=%0b b=%0b cin=%0b sum=%0b carry=%0b",
             name, a, b, cin, sum, carry);
  endfunction
endclass
