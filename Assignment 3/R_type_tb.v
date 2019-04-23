/*
	Name: Shrinidhi Anil Varna(17CO145)
	      Vybhav Pai(17CO252)
	      Chaitany Pandiya(17CO112)
*/

`include "R_type.v"
module R_tb;
reg [4:0] r1;
reg [4:0] r2;
reg [4:0] r3;
reg [5:0] ctrl;
reg clk;
wire [63:0] a;
wire [63:0] b;
wire [63:0] rd;
R_ins m(r1,r2,r3,clk,ctrl,a,b,rd);
initial
begin
	clk = 1'b0;
	repeat(100)	
	#2	clk = ~clk;
end
initial
	begin
	$dumpfile("R_type.vcd");
	$dumpvars(0, R_tb);
	r1 = 5'b010; r2 = 5'b110; r3 = 5'b111; ctrl = 6'b100000;
	#2 $display("%g rs1 = %b rs2 = %b rd = %b instruction = ADD",$time,a,b,rd);
	r1 = 5'b010; r2 = 5'b110; r3 = 5'b111; ctrl = 6'b101000;
	#4 $display("%g rs1 = %b rs2 = %b rd = %b instruction = SUB",$time,a,b,rd);
	r1 = 5'b010; r2 = 5'b110; r3 = 5'b111; ctrl = 6'b100111;
	#4 $display("%g rs1 = %b rs2 = %b rd = %b instruction = AND",$time,a,b,rd);
	r1 = 5'b010; r2 = 5'b110; r3 = 5'b111; ctrl = 6'b100110;
	#4 $display("%g rs1 = %b rs2 = %b rd = %b instruction = OR",$time,a,b,rd);
	r1 = 5'b010; r2 = 5'b110; r3 = 5'b111; ctrl = 6'b101111;
	#4 $display("%g rs1 = %b rs2 = %b rd = %b instruction = NOR",$time,a,b,rd);
	r1 = 5'b010; r2 = 5'b110; r3 = 5'b111; ctrl = 6'b101110;
	#4 $display("%g rs1 = %b rs2 = %b rd = %b instruction = NAND",$time,a,b,rd);
	end
initial
begin
#50 $finish;
end

endmodule
 
	
