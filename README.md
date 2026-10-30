# VHDL — Four-Sample Moving-Average Low-Pass Filter

A small VHDL design that computes a four-sample moving average, which acts as a simple low-pass FIR filter.

## Interface

- `clk` — rising-edge clock.
- `run` — enables sample updates.
- `data_in` — unsigned 8-bit input sample.
- `data_out` — 8-bit averaged output.

## Repository layout

- `src/main.vhd` — `LPF` design entity.
- `sim/tb.vhd` — supplied simulation testbench.

## Validation notes

The source and testbench are included as supplied, but no independent GHDL/ModelSim run was completed during repository preparation. The design uses a registered accumulator/output, so the output has a clock-cycle latency. The `x3` shift-register signal is currently assigned but not used in the sum. The testbench has no assertions or expected-output checks; add those before describing the design as verified.
