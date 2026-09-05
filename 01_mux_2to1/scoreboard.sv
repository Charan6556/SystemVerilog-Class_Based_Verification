class scoreboard;
  mailbox #(transaction) mon2scb;
  int pass_count;
  int fail_count;

  function new(mailbox #(transaction) mon2scb);
    this.mon2scb = mon2scb;
  endfunction

  task main();
    transaction trans;
    bit expected;

    repeat (8) begin
      mon2scb.get(trans);
      expected = trans.s ? trans.b : trans.a;

      if (trans.y === expected) begin
        pass_count++;
        $display("[SCB] PASS expected=%0b actual=%0b", expected, trans.y);
      end
      else begin
        fail_count++;
        $display("[SCB] FAIL expected=%0b actual=%0b", expected, trans.y);
      end
    end

    $display("[SCB] Summary: %0d passed, %0d failed", pass_count, fail_count);
  endtask
endclass
