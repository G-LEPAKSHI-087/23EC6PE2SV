//------------------------------------------------------------------------------
// File        : rcc.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : tb_and_gate
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple design for ripple carry counter. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
// Toggle Flip-Flop
module tff (q, clk, reset);

  output q;
  input clk, reset;
  
  reg q;
  
  always @(posedge reset or posedge clk) begin
    if (reset) begin
      q <= 1'b0;
    end else begin
      q <= ~q;
    end
  end
endmodule

// Ripple Carry Counter
module ripple_carry_counter (q, clk, reset);

  output [3:0] q;
  input clk, reset;
  
  tff tff0(q[0], ~clk, reset);
  tff tff1(q[1], ~q[0], reset);
  tff tff2(q[2], ~q[1], reset);
  tff tff3(q[3], ~q[2], reset);
  
endmodule