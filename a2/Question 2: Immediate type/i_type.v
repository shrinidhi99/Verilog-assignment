/*
	Name: Shrinidhi Anil Varna(17CO145)
	      Vybhav Pai(17CO252)
	      Chaitany Pandiya(17CO112)
*/
`include "alu+cu.v"

module i_ins(r1,imm,r3,clk,ctrl,a,rd,b);
input [4:0] r1;
input [11:0] imm;              // 12-bit immediate value
input [4:0] r3;
input [5:0] ctrl;
input clk;
reg [63:0] regFile[0:31];
output wire [63:0] a;
output reg [63:0] b;           // 'b' converts 12 bit immediate value to 64 bits
output wire [63:0] rd;
wire cout, zero, overflow;
integer i;
initial
begin
	for(i=0;i<32;i=i+1)
	begin
		regFile[i] <= i;
	end
end
//ReadModule
	assign a=regFile[r1];
	

	always@(*)
	begin
		b[11:0]= imm[11:0];
		b[63:12]={52{imm[11]}};
	end

	
ALU m1(a,b,ctrl[3:0],ctrl[5:4],rd,cout,zero,overflow);
//WriteModule
	always@(posedge clk)
	begin	
		regFile[r3] <= rd;
	end

endmodule
	
