`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2023 06:22:47
// Design Name: 
// Module Name: arithmetic_block
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


module arithmetic_block(input [31:0] A, B,  // Inputs
                        input [1:0] opcode,  // Operation code (0: Addition, 1: Subtraction)
                        output reg [31:0] result);  // Arithmetic block output

  always @(*)
  begin
    case (opcode)
      2'b00: result = A + B;  // Addition
      2'b01: result = A - B;  // Subtraction
      default: result = 32'b0; // Default case
    endcase
  end

endmodule

