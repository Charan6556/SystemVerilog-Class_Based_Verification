class generator;
  mailbox #(transaction) gen2drv;

  function new(mailbox #(transaction) gen2drv);
    this.gen2drv = gen2drv;
  endfunction

  task main();
    transaction trans;

    for (int i = 0; i < 8; i++) begin
      trans = new();
      {trans.a, trans.b, trans.s} = i[2:0];
      trans.display("GEN");
      gen2drv.put(trans);
    end
  endtask
endclass
