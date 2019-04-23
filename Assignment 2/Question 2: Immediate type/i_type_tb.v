/*
	Name: Shrinidhi Anil Varna(17CO145)
	      Vybhav Pai(17CO252)
	      Chaitany Pandiya(17CO112)
*/

`include "i_type.v"
module i_type_tb;
reg [4:0] r1;
reg [4:0] r3;
reg [5:0] ctrl;
reg clk;
wire [63:0] b;
reg [11:0] imm;  // 12-bit immediate value to be sent to the ALU
wire [63:0] a;
wire [63:0] rd;
i_ins m(r1,imm,r3,clk,ctrl,a,rd,b);
initial
begin
	clk = 1'b0;
	repeat(100)	
	#2	clk = ~clk;
end
initial
	begin
	$dumpfile("i_type.vcd");
	$dumpvars(0, i_type_tb);
	r1 = 5'b010; imm = 12'b111111111010; r3 = 5'b111; ctrl = 6'b100000;
	#2 $display("%g rs1 = %b imm = %b rd = %b instruction = ADDI",$time,a,b,rd);
	r1 = 5'b1; imm = 12'b10; r3 = 5'b111; ctrl = 6'b101000;
	#4 $display("%g rs1 = %b imm = %b rd = %b instruction = SUBI",$time,a,b,rd);
	r1 = 5'b010; imm = 12'b111000101010; r3 = 5'b111; ctrl = 6'b100111;
	#4 $display("%g rs1 = %b imm = %b rd = %b instruction = ANDI",$time,a,b,rd);
	r1 = 5'b010; imm = 12'b111111101010; r3 = 5'b111; ctrl = 6'b100110;
	#4 $display("%g rs1 = %b imm = %b rd = %b instruction = ORI",$time,a,b,rd);
	r1 = 5'b010; imm = 12'b011101; r3 = 5'b111; ctrl = 6'b101111;
	#4 $display("%g rs1 = %b imm = %b rd = %b instruction = NORI",$time,a,b,rd);
	r1 = 5'b010; imm = 12'b0; r3 = 5'b111; ctrl = 6'b101110;
	#4 $display("%g rs1 = %b imm = %b rd = %b instruction = NANDI",$time,a,b,rd);
	end
initial
begin
#50 $finish;
end

endmodule
 
	
