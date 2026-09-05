class driver;
  mailbox #(transaction) gen2drv;
  virtual full_adder_if vif;

  function new(virtual full_adder_if vif, mailbox #(transaction) gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction

  task main();
    transaction trans;

    repeat (8) begin
      gen2drv.get(trans);

      vif.a   = trans.a;
      vif.b   = trans.b;
      vif.cin = trans.cin;

      #1;
      -> vif.sample_ev;
      #1;
    end
  endtask
endclass
