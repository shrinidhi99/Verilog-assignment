/*
	Name: Shrinidhi Anil Varna(17CO145)
	      Vybhav Pai(17CO252)
	      Chaitany Pandiya(17CO112)
*/
`include "alu+cu.v"

module beq_ins(r1,r2,imm,clk,ctrl,pc,npc);
input [4:0] r1;
input [4:0] r2;
input [11:0] imm;
input [5:0] ctrl;
input clk;
input [31:0] pc; // program counter
reg [63:0] regFile[0:31];
wire [63:0] a;
wire [63:0] b;
reg [63:0] x;
output wire [63:0] rd;
output reg [31:0] npc; // new or updated program counter
wire cout, zero, overflow;
wire [12:0] offset;   
assign offset = imm << 1; // left shifting immediate value sent by 1 to get the desired offset for further calculations
integer i;
initial
begin
	for(i=0;i<16;i=i+1)
	begin
		regFile[i] <= i;
	end
end
initial
begin
	for(i=16;i<32;i=i+1)
	begin
		regFile[i] <= 32-i;
	end
end

	always@(*)
	begin
		x[11:0]= offset[12:0];
		x[63:12]={52{offset[12]}};
	end
	
//ReadModule
	assign a=regFile[r1];
	assign b=regFile[r2];
ALU m1(a,b,ctrl[3:0],ctrl[5:4],rd,cout,zero,overflow);
//WriteModule
	always@(posedge clk)
	begin	
		npc = (zero == 1)? (pc+x):(pc+64'b100); 
	end

endmodule
	
