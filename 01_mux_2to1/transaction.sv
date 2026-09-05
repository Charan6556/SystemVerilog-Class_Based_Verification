class transaction;
  bit a;
  bit b;
  bit s;
  bit y;

  function void display(string name);
    $display("[%s] a=%0b b=%0b s=%0b y=%0b", name, a, b, s, y);
  endfunction
endclass
