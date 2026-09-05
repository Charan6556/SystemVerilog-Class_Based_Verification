`timescale 1ns/1ps
`include "interface.sv"
`include "test.sv"

module testbench;
  mux_if intf();
  test tst(intf);

  mux_2to1 dut (
    .a(intf.a),
    .b(intf.b),
    .s(intf.s),
    .y(intf.y)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
  end
endmodule
