# Verilog Refresh

This lesson covers the basics of SystemVerilog for verification.

## Basic Verilog Module

A basic module structure in SystemVerilog:

```systemverilog
module my_module(
  input  logic clk,
  input  logic rst_n,
  input  logic data_in,
  output logic data_out
);
  // Module logic here
endmodule
```

## always_comb vs always_ff

### always_comb
Used for combinational logic:

```systemverilog
always_comb begin
  result = a + b;
end
```

### always_ff
Used for sequential (flip-flop) logic:

```systemverilog
always_ff @(posedge clk or negedge rst_n) begin
  if (!rst_n)
    q <= 1'b0;
  else
    q <= d;
end
```

## Blocking vs Non-blocking Assignments

- **Blocking (=)**: Used in combinational logic (always_comb)
- **Non-blocking (<=)**: Used in sequential logic (always_ff)

## Simple FSM Example

```systemverilog
typedef enum logic [1:0] {
  IDLE  = 2'b00,
  STATE1 = 2'b01,
  STATE2 = 2'b10
} state_t;

state_t current_state, next_state;

always_ff @(posedge clk or negedge rst_n) begin
  if (!rst_n)
    current_state <= IDLE;
  else
    current_state <= next_state;
end

always_comb begin
  case (current_state)
    IDLE: next_state = STATE1;
    STATE1: next_state = STATE2;
    STATE2: next_state = IDLE;
    default: next_state = IDLE;
  endcase
end
```

## Hello World Module: 1-bit Register

Here's a simple 1-bit register as a "hello world" example:

```systemverilog
module one_bit_register (
  input  logic clk,
  input  logic rst_n,
  input  logic d,      // Data input
  output logic q       // Data output
);

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      q <= 1'b0;  // Reset output to 0
    else
      q <= d;     // Store input value
  end

endmodule
```

## Summary

- Use `always_comb` for combinational logic with blocking assignments (=)
- Use `always_ff` for sequential logic with non-blocking assignments (<=)
- FSMs are commonly used in digital design
- A 1-bit register is the simplest sequential element
