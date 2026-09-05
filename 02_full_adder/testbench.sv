`timescale 1ns/1ps
`include "interface.sv"
`include "test.sv"

module testbench;
  full_adder_if intf();
  test tst(intf);

  full_adder dut (
    .a(intf.a),
    .b(intf.b),
    .cin(intf.cin),
    .sum(intf.sum),
    .carry(intf.carry)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
  end
endmodule
