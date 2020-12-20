module alu_tb #(
);
  
  logic clk;
  reg [31:0] data [0:105];
  reg [2:0] f;
  reg [31:0] a;
  reg [31:0] b;
  reg flag;
  integer i;
  reg [31:0] y_i;
  logic [31:0] y;
  
  reg zero;
  reg zero_i;
  

initial begin
  clk = $urandom_range(1,0);
  forever begin
    #5ns;
    clk =!clk;
  end
end

//initial begin
  
  alu #()
  alu_inst (
    	.a (a),
    	.b (b),
    	.f (f),
   		.y (y),
    .zero (zero),
    	.clk (clk)
  	);
  
initial begin
  $dumpfile("dump.vcd");              
  $dumpvars;  
end
  
initial $readmemh("alu.tv", data);
//initial $readmemh("test.tv", data);
initial i = 0;
  always @ (negedge clk) begin
    //for (i=0; i < 15; i = i+5) begin
    f = data[i];
    a = data[i+1];
    b = data[i+2];
    y_i = data[i+3];
    zero_i = data[i+4];
      i = i+5;
/*    $display("y : %h", y);
    $display("f : %b", f);
    $display("a : %h", a);
    $display("b : %h", b);
    $display("y_i : %h", y_i);
    $display("zero_i : %h", zero_i);
    if (y_i != y) begin 
        $display("Failed!");
      end else if (zero_i != zero) begin
        $display("Failed!");
    end 
*/    
    if (i > 106) begin
      $finish;
    end
      
      //$display("f: %d, a: %h, b: %h, y: %h, zero: %d", f, a, b, y, zero);
    end
endmodule
