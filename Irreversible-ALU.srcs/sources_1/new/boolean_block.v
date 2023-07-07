module boolean_block(input [31:0] A, B,  // Inputs
                     input [1:0] opcode,  // Operation code (0: AND, 1: OR, 2: XOR, 3: Complement)
                     output reg [31:0] result);  // Boolean block output

  always @(*)
  begin
    case (opcode)
      2'b00: result = A & B;  // Bitwise AND
      2'b01: result = A | B;  // Bitwise OR
      2'b10: result = A ^ B;  // Bitwise XOR
      2'b11: result = ~A;     // Bitwise complement
      default: result = 32'b0; // Default case
    endcase
  end

endmodule
