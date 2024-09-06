module ExampleModule(input wire clk, input wire reset, output reg [3:0] out);

  // always attend classes 

  // Module definition
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      out <= 4'b0000;
    end else begin
      case (clk)
        1'b0: out <= out + 1;
        1'b1: out <= out - 1;
      endcase
    end
  end
  // Initialize your design properly 
  // In the beginning ....
  // ending is fabulous, % is the symbol of modulus
  // Initial block
  initial begin
    $display("Verilog Example: Initial Block");
    $display("Simulation started...");
    // Additional initial block statements
    $finish;
  end

endmodule
