class generator;
  mailbox #(transaction) gen2drv;

  function new(mailbox #(transaction) gen2drv);
    this.gen2drv = gen2drv;
  endfunction

  task main();
    transaction trans;

    for (int i = 0; i < 16; i++) begin
      trans = new();
      trans.rst = (i < 2) || (i == 10);
      trans.display("GEN");
      gen2drv.put(trans);
    end
  endtask
endclass
