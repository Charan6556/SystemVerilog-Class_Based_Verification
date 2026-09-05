class monitor;
  virtual full_adder_if vif;
  mailbox #(transaction) mon2scb;

  function new(virtual full_adder_if vif, mailbox #(transaction) mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction

  task main();
    transaction trans;

    repeat (8) begin
      @vif.sample_ev;

      trans = new();
      trans.a     = vif.a;
      trans.b     = vif.b;
      trans.cin   = vif.cin;
      trans.sum   = vif.sum;
      trans.carry = vif.carry;

      trans.display("MON");
      mon2scb.put(trans);
    end
  endtask
endclass
