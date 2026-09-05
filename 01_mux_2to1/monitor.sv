class monitor;
  mailbox #(transaction) mon2scb;
  virtual mux_if vif;

  function new(virtual mux_if vif, mailbox #(transaction) mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction

  task main();
    transaction trans;

    repeat (8) begin
      @vif.sample_ev;

      trans = new();
      trans.a = vif.a;
      trans.b = vif.b;
      trans.s = vif.s;
      trans.y = vif.y;

      trans.display("MON");
      mon2scb.put(trans);
    end
  endtask
endclass
