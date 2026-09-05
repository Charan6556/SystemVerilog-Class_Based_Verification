class transaction;
  bit rst;
  bit [3:0] count;

  function void display(string name);
    $display("[%s] rst=%0b count=%0d", name, rst, count);
  endfunction
endclass
