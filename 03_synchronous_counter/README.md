# Synchronous Counter Verification

This directory contains the RTL design and a class-based SystemVerilog verification environment for this design.

## Components

- `transaction.sv` — transaction object used to transfer stimulus and observed data
- `generator.sv` — produces test transactions
- `driver.sv` — drives transactions onto the DUT interface
- `monitor.sv` — samples DUT inputs and outputs
- `scoreboard.sv` — computes expected behavior and checks DUT results
- `environment.sv` — creates and connects verification components
- `test.sv` — starts the environment
- `interface.sv` — groups DUT/testbench signals
- `testbench.sv` — top-level testbench
- `design.sv` — DUT RTL
