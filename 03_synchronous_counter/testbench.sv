`timescale 1ns/1ps
`include "interface.sv"
`include "test.sv"

module testbench;
  logic clk = 1'b0;
  counter_if intf(clk);
  test tst(intf);

  synchronous_counter dut (
    .clk(clk),
    .rst(intf.rst),
    .count(intf.count)
  );

  always #5 clk = ~clk;

  initial begin
    intf.rst = 1'b1;
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
  end
endmodule
