//------------------------------------------------------------------------------
// File        : tb_rcc.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : tb_and_gate
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for ripple carry countetr. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------

`timescale 1ns/1ps
module test;

  reg clk, reset;
  wire [3:0] q;
  
  // Instantiate the design
  ripple_carry_counter rcc (q, clk, reset);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, test);
    
    // Initialize the clk
    clk = 1'b0;
    
    // Reset the counter
    reset = 1'b1;
    #10 reset = 1'b0;
    
    #200;
    reset = 1'b1;
    #10 reset = 1'b0;
    
    #50;
    $finish;
  end
  
  always #5 clk = ~clk;

endmodule