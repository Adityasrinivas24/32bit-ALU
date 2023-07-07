module shifter_block(input [31:0] data_in,
                     input [1:0] shift_mode,  // Shift mode (0: No shift, 1: Left shift, 2: Right shift)
                     output reg [31:0] shifted_data);  // Shifter block output

  always @(*)
  begin
    case (shift_mode)
      2'b00: shifted_data = data_in;   // No shift
      2'b01: shifted_data = data_in << 1;  // Left shift by 1
      2'b10: shifted_data = data_in >> 1;  // Right shift by 1
      default: shifted_data = data_in;  // Default case
    endcase
  end

endmodule
