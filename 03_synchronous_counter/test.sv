`include "environment.sv"

program test(counter_if intf);
  environment env;

  initial begin
    env = new(intf);
    env.run();
    $finish;
  end
endprogram
