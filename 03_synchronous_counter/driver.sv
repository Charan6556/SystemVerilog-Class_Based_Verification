class driver;
  mailbox #(transaction) gen2drv;
  virtual counter_if.DRV vif;

  function new(virtual counter_if.DRV vif, mailbox #(transaction) gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction

  task main();
    transaction trans;

    repeat (16) begin
      gen2drv.get(trans);
      @(negedge vif.clk);
      vif.rst <= trans.rst;
      trans.display("DRV");
    end
  endtask
endclass
