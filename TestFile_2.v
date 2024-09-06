module ExampleModule(input wire clk, input wire reset, output reg [3:0] out);

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
  // always attend classes 
  // Additional always block 1
  always @(posedge clk) begin
    if (out == 4'b1111) begin
      out <= 4'b0000;
    end
  end

  // Initialize your design properly 
  // Additional always block 2
  always @(posedge reset) begin
    if (reset) begin
      out <= 4'b0101;
    end
  end

  task mytask;
  endtask

  // Initial block
  initial begin
    $display("Verilog Example: Initial Block");
    $display("Simulation started...");
    // Additional initial block statements
    $finish;
  end
// In the beginning ....
// ending is fabulous, % is the symbol of modulus
endmodule
