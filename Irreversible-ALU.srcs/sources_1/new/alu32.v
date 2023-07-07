`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2023 06:26:36
// Design Name: 
// Module Name: alu32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu32(
    input [31:0] A,
    input [31:0] B,
    input [7:0] CONTROL,
    output reg [31:0] OUT
);

  wire [31:0] t1, t2, t3, t4;
  wire carry;

  shifter_block u1(.data_in(A), .shift_mode(CONTROL[5:4]), .shifted_data(t1));
  boolean_block u2(.A(A), .B(B), .opcode(CONTROL[3:2]), .result(t2));
  arithmetic_block u3(.A(A), .B(B), .opcode(CONTROL[1]), .result(t3));
  comparator_block u4(.a(A), .b(B), .con(CONTROL[0]), .out(t4));

  always @(*)
  begin
    case(CONTROL[7:6])
      2'b00: OUT = t1;
      2'b01: OUT = t2;
      2'b10: OUT = t3;
      2'b11: OUT = t4;
      default: OUT = 32'bx;
    endcase
  end

endmodule
