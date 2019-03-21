/*
	Name: Shrinidhi Anil Varna(17CO145)
	      Vybhav Pai(17CO252)
	      Chaitany Pandiya(17CO112)
*/
`include "alu+cu.v"

module R_ins(r1,r2,r3,clk,ctrl,a,b,rd);
input [4:0] r1;
input [4:0] r2;
input [4:0] r3;
input [5:0] ctrl; // the reduced function bits from 32-bit R-type instruction
input clk;
reg [63:0] regFile[0:31];
output wire [63:0] a;
output wire [63:0] b;
output wire [63:0] rd;
wire cout, zero, overflow;
integer i;
initial
begin
	for(i=0;i<32;i=i+1)
	begin
		regFile[i] <= 64'b10101;
	end
end
//ReadModule
	assign a=regFile[r1];
	assign b=regFile[r2];
ALU m1(a,b,ctrl[3:0],ctrl[5:4],rd,cout,zero,overflow);
//WriteModule
	always@(posedge clk)
	begin	
		regFile[r3] <= rd;
	end

endmodule
	
