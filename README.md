# SystemVerilog Class-Based Verification Practice

A collection of small SystemVerilog verification environments built to practice the core concepts that underpin UVM: transactions, generators, drivers, monitors, mailboxes, virtual interfaces, environments, and self-checking scoreboards.

## Projects

| Project | DUT Type | Verification Focus |
|---|---|---|
| `01_mux_2to1` | Combinational | Transaction flow, mailbox communication, exhaustive stimulus, scoreboard |
| `02_full_adder` | Combinational | Exhaustive input-space verification, reference model, self-checking scoreboard |
| `03_synchronous_counter` | Sequential | Clocked stimulus, reset handling, virtual-interface modports, stateful reference model |

## Testbench Architecture

```text
Transaction
    |
Generator
    |
  Mailbox
    |
 Driver ---> Interface ---> DUT
                         |
                      Monitor
                         |
                       Mailbox
                         |
                     Scoreboard
```

Each environment separates stimulus generation, DUT driving, signal observation, and result checking into independent components.

## Highlights

- Class-based SystemVerilog testbench architecture
- Typed mailboxes for transaction communication
- Virtual interfaces for class-to-DUT connectivity
- Exhaustive verification of all 8 input combinations for the 2:1 mux and full adder
- Self-checking scoreboards with pass/fail summaries
- Sequential counter verification with reset recovery and an independent expected-count model
- Simulator-generated artifacts excluded through `.gitignore`

## Running a Project

Compile `design.sv` and `testbench.sv` from the selected project directory using a SystemVerilog simulator such as Synopsys VCS, Cadence Xcelium, or Siemens Questa.

Example with VCS:

```bash
vcs -sverilog design.sv testbench.sv -o simv
./simv
```

Example with Xcelium:

```bash
xrun -sv design.sv testbench.sv
```

## Repository Goal

This repository documents my progression from basic class-based verification toward constrained-random, coverage-driven, assertion-based, and UVM verification environments.
