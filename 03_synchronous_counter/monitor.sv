class monitor;
  virtual counter_if.MON vif;
  mailbox #(transaction) mon2scb;

  function new(virtual counter_if.MON vif, mailbox #(transaction) mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction

  task main();
    transaction trans;

    @(negedge vif.clk);

    repeat (16) begin
      @(posedge vif.clk);
      #1;

      trans = new();
      trans.rst   = vif.rst;
      trans.count = vif.count;

      trans.display("MON");
      mon2scb.put(trans);
    end
  endtask
endclass
