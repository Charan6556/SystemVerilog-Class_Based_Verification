class scoreboard;
  mailbox #(transaction) mon2scb;
  bit [3:0] expected_count;
  int pass_count;
  int fail_count;

  function new(mailbox #(transaction) mon2scb);
    this.mon2scb = mon2scb;
    expected_count = 4'd0;
  endfunction

  task main();
    transaction trans;

    repeat (16) begin
      mon2scb.get(trans);

      if (trans.rst)
        expected_count = 4'd0;
      else
        expected_count = expected_count + 4'd1;

      if (trans.count === expected_count) begin
        pass_count++;
        $display("[SCB] PASS expected=%0d actual=%0d",
                 expected_count, trans.count);
      end
      else begin
        fail_count++;
        $display("[SCB] FAIL expected=%0d actual=%0d",
                 expected_count, trans.count);
      end
    end

    $display("[SCB] Summary: %0d passed, %0d failed", pass_count, fail_count);
  endtask
endclass
