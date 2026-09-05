class driver;
  mailbox #(transaction) gen2drv;
  virtual mux_if vif;

  function new(mailbox #(transaction) gen2drv, virtual mux_if vif);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction

  task main();
    transaction trans;

    repeat (8) begin
      gen2drv.get(trans);

      vif.a = trans.a;
      vif.b = trans.b;
      vif.s = trans.s;

      #1;
      -> vif.sample_ev;
      #1;
    end
  endtask
endclass
