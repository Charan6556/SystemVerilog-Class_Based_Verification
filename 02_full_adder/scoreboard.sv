class scoreboard;
  mailbox #(transaction) mon2scb;
  int pass_count;
  int fail_count;

  function new(mailbox #(transaction) mon2scb);
    this.mon2scb = mon2scb;
  endfunction

  task main();
    transaction trans;
    bit expected_sum;
    bit expected_carry;

    repeat (8) begin
      mon2scb.get(trans);

      expected_sum   = trans.a ^ trans.b ^ trans.cin;
      expected_carry = (trans.a & trans.b) |
                       (trans.b & trans.cin) |
                       (trans.cin & trans.a);

      if ((trans.sum === expected_sum) && (trans.carry === expected_carry)) begin
        pass_count++;
        $display("[SCB] PASS expected={%0b,%0b} actual={%0b,%0b}",
                 expected_carry, expected_sum, trans.carry, trans.sum);
      end
      else begin
        fail_count++;
        $display("[SCB] FAIL expected={%0b,%0b} actual={%0b,%0b}",
                 expected_carry, expected_sum, trans.carry, trans.sum);
      end
    end

    $display("[SCB] Summary: %0d passed, %0d failed", pass_count, fail_count);
  endtask
endclass
