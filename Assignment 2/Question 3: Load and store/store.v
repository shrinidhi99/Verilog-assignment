/*
	Name: Shrinidhi Anil Varna(17CO145)
	      Vybhav Pai(17CO252)
	      Chaitany Pandiya(17CO112)
*/

`include "alu+cu.v"

module store(r1,r2,offset,clk,a,rd,writedata);
input [4:0] r1;
input [4:0] r2;
input clk;
reg [63:0] x;
input [11:0] offset;
reg [63:0] regFile[0:31];
output wire [63:0] a;
output wire [63:0] rd;
output reg [63:0] writedata;
wire cout, zero, overflow;
integer i;
reg [63:0] MEMO[0:10000];  // 10000 words of 64-bit memory

initial
begin
	for(i=0;i<32;i=i+1)
	begin
		regFile[i] <= i;
	end
end
initial
	begin
 
	for (i = 0; i < 80; i = i + 1)
	begin
	    MEMO[i] <= i;
	end
end

	always@(*)
	begin
		x[11:0]= offset[11:0];
		x[63:12]={52{offset[11]}};
	end
	
	assign a=regFile[r1];
	ALU m1(a,x,4'b0000,2'b10,rd,cout,zero,overflow);
	always@(posedge clk)
	begin	
	
	MEMO[r2] = regFile[rd];
	writedata = regFile[rd];
	end
	 

endmodule
	
