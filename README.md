# VHDL Integer Overflow in Counter

This repository demonstrates a potential integer overflow issue in a simple VHDL counter. The `INTEGER` type in VHDL has an unbounded range, which can lead to unexpected simulation results or hardware issues.  The original code uses `INTEGER` for the counter; the solution demonstrates a safer approach using a `NATURAL` range-constrained type.

## Bug Description

The `counter.vhdl` file contains a counter implemented using the `INTEGER` data type.  While this works for many cases, if the counter exceeds the maximum value allowed by the simulator or target hardware, it will wrap around to the minimum value, leading to unpredictable results.

## Solution

The `counter_fixed.vhdl` file provides a corrected version where the counter uses `NATURAL range 0 to 1023`. This limits the range to a specific number of bits, preventing overflow.

## How to reproduce

1. Simulate `counter.vhdl` with a testbench that drives the clock for a long enough time to cause an integer overflow.
2. Observe the counter's behavior. It will eventually wrap around to 0.
3. Simulate `counter_fixed.vhdl` with the same testbench.  The counter will stop at the maximum value (1023).