interface counter_if(input logic clk);
  logic rst;
  logic [3:0] count;

  modport DRV (input clk, output rst);
  modport MON (input clk, rst, count);
endinterface
