/*
	Name: Shrinidhi Anil Varna(17CO145)
	      Vybhav Pai(17CO252)
	      Chaitany Pandiya(17CO112)
*/

`include "beq.v"
module beq_tb;
reg [4:0] r1;
reg [4:0] r2;
reg [5:0] ctrl;
reg clk;
reg [11:0] imm;
reg [31:0] pc;
wire [31:0] npc;
beq_ins m(r1,r2,imm,clk,ctrl,pc,npc);
initial
begin
	clk = 1'b0;
	repeat(100)	
	#2	clk = ~clk;
end
initial
	begin
	$dumpfile("beq.vcd");
	$dumpvars(0, beq_tb);
	r1 = 5'b010; r2 = 5'b110; imm = 12'b10000; ctrl = 6'b101000; pc = 32'b100;
	#5 $display("%g rs1 = %b rs2 = %b PC = %b nPC = %b instruction = BEQ",$time,r1,r2,pc,npc);
	r1 = 5'b01; r2 = 5'b11111; imm = 12'b10100; ctrl = 6'b101000; pc = 32'b100;
	#4 $display("%g rs1 = %b rs2 = %b PC = %b nPC = %b instruction = BEQ",$time,r1,r2,pc,npc);
	r1 = 5'b010; r2 = 5'b11011; imm = 12'b10001; ctrl = 6'b101000; pc = 32'b100;
	#4 $display("%g rs1 = %b rs2 = %b PC = %b nPC = %b instruction = BEQ",$time,r1,r2,pc,npc);
	r1 = 5'b010; r2 = 5'b1110; imm = 12'b100011; ctrl = 6'b101000; pc = 32'b100;
	#4 $display("%g rs1 = %b rs2 = %b PC = %b nPC = %b instruction = BEQ",$time,r1,r2,pc,npc);
	r1 = 5'b0101; r2 = 5'b11011; imm = 12'b1001100; ctrl = 6'b101000; pc = 32'b100;
	#4 $display("%g rs1 = %b rs2 = %b PC = %b nPC = %b instruction = BEQ",$time,r1,r2,pc,npc);
	end
initial
begin
#50 $finish;
end

endmodule
 
	
