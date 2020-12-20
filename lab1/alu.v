module alu (input logic signed [31:0] a,
  	 		input logic signed [31:0] b,
   			input logic [2:0] f,
   			input logic clk,
   			output logic signed [31:0] y,
   			output reg zero
           );
  //reg [1:0] add32bit = 3'b010;
  reg [31:0] sub32bit;
  //reg [1:0] and32bit = 3'b011;
  //reg [1:0] or32bit = 3'b100;
  //reg [1:0] slt32bit = 3'b111;

  
  always @(posedge clk) begin
    if (f == 3'b010) begin
      y = (a + b);
    end
    if (f == 3'b110) begin
      y <= (a - b);
    end
    if (f == 3'b011) begin
      y <= (a & b);
    end
    if (f == 3'b100) begin
      y <= (a | b);
    end
    if (f == 3'b111) begin
      	sub32bit <= (a - b);
      y = sub32bit[31] ? 1 : 32'h0;
    end
    if(y == 32'h0) begin
		assign zero = 1;
    end else begin
  		assign zero = 0;
 	end  
  end
endmodule
    