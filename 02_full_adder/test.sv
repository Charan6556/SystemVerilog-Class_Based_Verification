`include "environment.sv"

program test(full_adder_if intf);
  environment env;

  initial begin
    env = new(intf);
    env.run();
    $finish;
  end
endprogram
