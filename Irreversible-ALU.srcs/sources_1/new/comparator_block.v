module comparator_block(input [31:0] a, b,  // Inputs
                        input [1:0] con,  // Condition code (0: Greater than, 1: Less than, 2: Equal, 3: Not equal)
                        output reg out);  // Comparator block output

  assign gt = (a > b);
  assign lt = (a < b);
  assign eq = (a == b);
  assign neq = (a != b);

  always @(*)
  begin
    case (con)
      2'b00: out = gt;
      2'b01: out = lt;
      2'b10: out = eq;
      2'b11: out = neq;
      default: out = 1'b0;
    endcase
  end

endmodule
